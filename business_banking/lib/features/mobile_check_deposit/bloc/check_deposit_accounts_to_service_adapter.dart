import 'package:business_banking/features/mobile_check_deposit/api/accounts/check_deposit_to_accounts_response_model.dart';
import 'package:business_banking/features/mobile_check_deposit/api/accounts/check_deposit_to_accounts_service.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CheckDepositToAccountServiceAdapter extends ServiceAdapter<
    CheckDepositEntity,
    JsonRequestModel,
    CheckDepositToAccountResponseModel,
    CheckDepositToAccountService> {
    CheckDepositToAccountServiceAdapter() : super(CheckDepositToAccountService());

  @override
  CheckDepositEntity createEntity(
      CheckDepositEntity initialEntity,
      CheckDepositToAccountResponseModel responseModel) {
    return initialEntity.merge(errors: <EntityFailure>[],toAccounts: responseModel.toAccounts);
  }
}