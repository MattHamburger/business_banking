import 'package:business_banking/features/stocks/api/stocks_response_model.dart';
import 'package:business_banking/features/stocks/api/stocks_service.dart';
import 'package:business_banking/features/stocks/model/stocks_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StocksServiceAdapter extends ServiceAdapter<StocksEntity, JsonRequestModel, StocksServiceResponseModel, StocksService> {
  StocksServiceAdapter() : super(StocksService());

  @override
  StocksEntity createEntity(StocksEntity stocksEntityModel, StocksServiceResponseModel responseModel) {
    return stocksEntityModel.merge(
      stockPrices: responseModel.stockPrices,
    ) as StocksEntity;
  }
}