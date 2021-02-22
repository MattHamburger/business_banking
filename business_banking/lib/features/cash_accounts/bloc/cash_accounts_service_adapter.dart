import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../locator.dart';

class CashAccountsServiceAdapter extends ServiceAdapter<CashAccountsEntity,
    JsonRequestModel, CashAccountsServiceResponseModel, CashAccountsService> {
  CashAccountsServiceAdapter() : super(CashAccountsService());
  final bool debugEnabled = false;

  @override
  CashAccountsEntity createEntity(
      CashAccountsEntity cashAccountsEntityModelList,
      CashAccountsServiceResponseModel responseModel) {
    /// Debug JSON Response Log
    if (debugEnabled) {
      logger().debug('CashAccountsEntityModelList CreateEntity: ' +
          responseModel.toString());
    }

    return cashAccountsEntityModelList.merge(
      name: responseModel.name,
      balance: responseModel.balance,
      lastFour: responseModel.lastFour,
    );
  }
}
