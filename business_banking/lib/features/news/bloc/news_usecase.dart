import 'package:business_banking/features/news/bloc/news_service_adapter.dart';
import 'package:business_banking/features/news/model/news_entity.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class NewsUsecase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  NewsUsecase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<NewsEntity>();
    if (_scope == null) {
      final newEntity = NewsEntity();
      _scope = ExampleLocator()
          .repository
          .create<NewsEntity>(newEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, NewsServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _buildViewModelForServiceUpdate(entity);
  }

  _buildViewModelForServiceUpdate(NewsEntity entity) {
    if (entity.hasErrors()) {
      _viewModelCallBack(NewsViewModel(
          entity.allNews, entity.selectedNews, NewsServiceStatus.fail));
    } else {
      _viewModelCallBack(NewsViewModel(
          entity.allNews, entity.selectedNews, NewsServiceStatus.success));
    }
  }

  void updateSelectedNewsWithRowIndex(int index) async {
    final entity = ExampleLocator().repository.get<NewsEntity>(_scope);

    final selectedNews = entity.selectedItem(index);
    if (selectedNews != null) {
      final updatedEntity = entity.merge(selectedNews: selectedNews);
      ExampleLocator().repository.update<NewsEntity>(_scope, updatedEntity);
    }
  }
}
