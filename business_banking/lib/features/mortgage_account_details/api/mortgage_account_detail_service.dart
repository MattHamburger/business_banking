import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'mortgage_account_detail_service_response_model.dart';

class MortgageAccountDetailService
    extends EitherService<JsonRequestModel, MortgageAccountDetailServiceResponseModel> {
  MortgageAccountDetailService()
      : super(
      method: RestMethod.get,
      restApi: ExampleLocator().api,
      path: 'mortgage-account-details');

  @override
  MortgageAccountDetailServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return MortgageAccountDetailServiceResponseModel.fromJson(jsonResponse);
  }
}
