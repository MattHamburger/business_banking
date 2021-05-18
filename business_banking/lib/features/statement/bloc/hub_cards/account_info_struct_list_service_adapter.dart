import 'package:business_banking/features/statement/api/account_info_list_service.dart';
import 'package:business_banking/features/statement/api/account_info_list_service_response_model.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountInfoListServiceAdapter extends ServiceAdapter<
    StatementCardEntity,
    JsonRequestModel,
    AccountInfoListServiceResponseModel,
    AccountInfoListService> {
  AccountInfoListServiceAdapter() : super(AccountInfoListService());

  @override
  createEntity(initialEntity, responseModel) {
    return initialEntity.merge(
      accounts: responseModel.accounts,
    );
  }
}
