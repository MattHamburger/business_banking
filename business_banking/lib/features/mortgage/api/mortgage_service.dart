import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'mortgage_service_response_model.dart';

class MortgageService
    extends EitherService<JsonRequestModel, MortgageServiceResponseModel> {
  MortgageService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'mortgage');
  @override
  MortgageServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return MortgageServiceResponseModel.fromJson(jsonResponse);
  }
}
