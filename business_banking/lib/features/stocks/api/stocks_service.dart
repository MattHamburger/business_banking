import 'package:business_banking/features/stocks/api/stocks_response_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class StocksService extends EitherService<JsonRequestModel, StocksServiceResponseModel> {
  StocksService()
      : super(
    method: RestMethod.get,
    restApi: ExampleLocator().api,
    path: 'stock-prices',
  );

  @override
  StocksServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return StocksServiceResponseModel.fromJson(jsonResponse);
  }
}