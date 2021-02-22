import 'package:business_banking/features/mobile_check_deposit/api/accounts/check_deposit_to_accounts_response_model.dart';
import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_request_model.dart';
import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CheckDepositToAccountService extends EitherService<TransferFundsAccountsToRequestModel, CheckDepositToAccountResponseModel> {
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