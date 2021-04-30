import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'stocks_service_response_model.dart';

class StocksService
    extends EitherService<JsonRequestModel, StocksServiceResponseModel> {
  StocksService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'stocks');

  @override
  StocksServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return StocksServiceResponseModel.fromJson(jsonResponse);
  }
}
