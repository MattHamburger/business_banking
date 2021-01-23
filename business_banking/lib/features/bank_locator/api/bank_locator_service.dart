import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import './bank_locator_service_request_model.dart';
import './bank_locator_service_response_model.dart';

class BankLocatorService extends EitherService<BankLocatorServiceRequestModel,
    BankLocatorServiceResponseModel> {
  BankLocatorService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'bank-locator');

  @override
  BankLocatorServiceResponseModel parseResponse(
          Map<String, dynamic> jsonResponse) =>
      BankLocatorServiceResponseModel.fromJson(jsonResponse);
}
