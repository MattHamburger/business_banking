import 'package:business_banking/features/stocks_detail/api/stocks_service.dart';
import 'package:business_banking/features/stocks_detail/api/stocks_service_response_model.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StocksServiceAdapter extends ServiceAdapter<StocksEntity,
    JsonRequestModel, StocksServiceResponseModel, StocksService> {
  StocksServiceAdapter() : super(StocksService());

  @override
  StocksEntity createEntity(
      StocksEntity stocksEntity, StocksServiceResponseModel responseModel) {
    return stocksEntity.merge(stocks: responseModel.stocks);
  }
}
