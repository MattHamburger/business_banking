import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_entity.dart';
import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service.dart';
import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service_response_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class MortgageAccountsServiceAdapter extends ServiceAdapter<MortgageAccountsEntity,
    JsonRequestModel, MortgageAccountsServiceResponseModel, MortgageAccountsService> {
  MortgageAccountsServiceAdapter() : super(MortgageAccountsService());

  @override
  MortgageAccountsEntity createEntity(
      MortgageAccountsEntity initialEntity, MortgageAccountsServiceResponseModel responseModel) {
    return MortgageAccountsEntity(
        name: responseModel.name,
        lastFour: responseModel.lastFour,
        balance: responseModel.balance
    );
  }
}