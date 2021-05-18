import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'account_info_list_service_response_model.dart';

class AccountInfoListService extends EitherService<JsonRequestModel,
    AccountInfoListServiceResponseModel> {
  AccountInfoListService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'account-info-list');

  @override
  AccountInfoListServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return AccountInfoListServiceResponseModel.fromJson(jsonResponse);
  }
}
