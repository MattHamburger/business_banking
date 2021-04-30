import 'package:business_banking/features/stocks_detail/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_entity.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StocksListUseCase extends UseCase {
  Function(ViewModel) _viewModelCallback;
  StocksListUseCase(Function(ViewModel) viewModelCallback)
      : _viewModelCallback = viewModelCallback;
  late RepositoryScope _scope;

  void create() async {
    _scope = ExampleLocator()
        .repository
        .create<StocksEntity>(StocksEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, StocksServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  StocksListViewModel buildViewModel(StocksEntity stocksEntity) {
    return StocksListViewModel(stocksList: stocksEntity.stocks);
  }

  void deleteStock(int index) {
    final entity = ExampleLocator().repository.get<StocksEntity>(_scope);
    entity.deleteStockAtIndex(index);
  }
}
