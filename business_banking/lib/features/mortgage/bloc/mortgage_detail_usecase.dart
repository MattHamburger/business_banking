import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../locator.dart';
import '../model/mortgage_entity.dart';
import '../model/mortgage_detail_view_model.dart';
import 'mortgage_service_adaptor.dart';

class MortgageDetailUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  MortgageDetailUseCase(Function(ViewModel) viewModelCallback)
      : assert(viewModelCallback != null),
        _viewModelCallBack = viewModelCallback;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<MortgageEntity>();
    if (_scope == null) {
      final newMortgageDetailEntity = MortgageEntity();
      _scope = ExampleLocator()
          .repository
          .create(newMortgageDetailEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, MortgageServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  MortgageDetailViewModel buildViewModel(MortgageEntity entity) {
    return MortgageDetailViewModel(mortgageEntity: entity);
  }
}
