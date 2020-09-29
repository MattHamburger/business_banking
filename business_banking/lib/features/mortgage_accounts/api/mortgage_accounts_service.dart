import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'mortgage_accounts_service_response_model.dart';

class MortgageAccountsService extends EitherService<JsonRequestModel, MortgageAccountsServiceResponseModel> {
  MortgageAccountsService():
    super(
        method: RestMethod.get,
        restApi: ExampleLocator().api,
        path: 'mortgage-accounts'
    );


  @override
  MortgageAccountsServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return MortgageAccountsServiceResponseModel.fromJson(jsonResponse);
  }
}