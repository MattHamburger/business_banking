import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_entity.dart';
import 'package:business_banking/features/mortgage_account_details/api/mortgage_account_detail_service.dart';
import 'package:business_banking/features/mortgage_account_details/api/mortgage_account_detail_service_response_model.dart';

class MortgageAccountDetailServiceAdapter extends ServiceAdapter<MortgageAccountDetailEntity,
    JsonRequestModel, MortgageAccountDetailServiceResponseModel, MortgageAccountDetailService> {
  MortgageAccountDetailServiceAdapter() : super(MortgageAccountDetailService());

  @override
  MortgageAccountDetailEntity createEntity(MortgageAccountDetailEntity initialEntity,
      MortgageAccountDetailServiceResponseModel responseModel) {
    return MortgageAccountDetailEntity(
        name: responseModel.name,
        lastFour: responseModel.lastFour,
        accountType: responseModel.accountType,
        applicationNumber: responseModel.applicationNumber,
        balance: responseModel.balance,
        beginningBalance: responseModel.beginningBalance,
        pendingTransactions: responseModel.pendingTransactions,
        depositHolds: responseModel.depositHolds
    );
  }
}
