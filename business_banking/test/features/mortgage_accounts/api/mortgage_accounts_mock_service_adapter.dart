import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_service_adapter.dart';
import 'package:mockito/mockito.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_entity.dart';
import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service_response_model.dart';

class MortgageAccountsMockServiceAdapter extends Fake implements MortgageAccountsServiceAdapter {
  MortgageAccountsMockServiceAdapter();

  @override
  MortgageAccountsEntity createEntity(MortgageAccountsEntity initialEntity,
      MortgageAccountsServiceResponseModel responseModel) {
    return MortgageAccountsEntity(
        name: responseModel.name,
        lastFour: responseModel.lastFour,
        balance: responseModel.balance
    );
  }
}
