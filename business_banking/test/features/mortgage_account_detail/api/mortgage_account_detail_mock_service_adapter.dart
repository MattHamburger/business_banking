
import 'package:business_banking/features/mortgage_account_details/api/mortgage_account_detail_service_response_model.dart';
import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_service_adapter.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_entity.dart';
import 'package:mockito/mockito.dart';

class MortgageAccountDetailMockServiceAdapter extends Fake implements MortgageAccountDetailServiceAdapter {

  MortgageAccountDetailMockServiceAdapter();

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