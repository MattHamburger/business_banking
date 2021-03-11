//package
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
// internal
import '../../../locator.dart';
import 'investment_service_response_model.dart';

class InvestmentService
    extends EitherService<JsonRequestModel, InvestmentServiceResponseModel> {
  InvestmentService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'investment-account');

  @override
  InvestmentServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return InvestmentServiceResponseModel.fromJson(jsonResponse);
  }
}
