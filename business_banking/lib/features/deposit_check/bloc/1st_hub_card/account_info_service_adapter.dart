import 'package:business_banking/features/deposit_check/api/account_info_response_model.dart';
import 'package:business_banking/features/deposit_check/api/account_info_service.dart';
import 'package:business_banking/features/deposit_check/model/1st_hub_card/deposit_check_card_entity.dart';
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountInfoServiceAdapter extends ServiceAdapter<DepositCheckCardEntity,
    JsonRequestModel, AccountInfoServiceResponseModel, AccountInfoService> {
  AccountInfoServiceAdapter() : super(AccountInfoService());

  @override
  createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
      accountInfo: AccountInfoStruct(
          accountNickname: responseModel.accountNickname,
          accountNumber: responseModel.accountNumber,
          availableBalance: responseModel.availableBalance,
          depositLimit: responseModel.depositLimit),
    );
  }
}
