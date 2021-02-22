import 'package:business_banking/features/mobile_check_deposit/api/accounts/check_deposit_to_accounts_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'check_deposit_to_accounts_request_model.dart';

class CheckDepositToAccountService extends EitherService<CheckDepositToAccountsRequestModel, CheckDepositToAccountResponseModel> {
  CheckDepositToAccountService() : super(
      method: RestMethod.post,
      restApi: ExampleLocator().api,
      path: 'transfer-accounts-to'
  );

  @override
  CheckDepositToAccountResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return CheckDepositToAccountResponseModel.fromJson(jsonResponse);
  }
}