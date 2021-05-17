import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/stocks/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks/model/stocks_entity.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallBack;
  StocksUseCase(ViewModelCallback<ViewModel> viewModelCallBack) : _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
    //print("CreditCardUseCase.create");
    final scope = ExampleLocator().repository.create<StocksEntity>(StocksEntity(), _notifySubscribers);

    //print("CreditCardUseCase. ExampleLocator().repository.runServiceAdapter");
    return ExampleLocator().repository.runServiceAdapter(scope, StocksServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  StocksViewModel buildViewModel(StocksEntity stocksEntityModel) {
    if (stocksEntityModel.hasErrors()){
      return StocksViewModel(
        stockPrices: stocksEntityModel.stockPrices, serviceResponseStatus: ServiceResponseStatus.failed
      );
    }else{
      return StocksViewModel(
        stockPrices: stocksEntityModel.stockPrices, serviceResponseStatus: ServiceResponseStatus.succeed
      );
    }

  }

}