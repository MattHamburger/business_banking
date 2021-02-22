import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_to_response_model.dart';
import 'package:business_banking/features/transfer_funds/bloc/transfer_accounts_to_service_adapter.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity for to accounts is created by service adapter', () {
    final entity = TransferFundsAccountsToServiceAdapter().createEntity(
        TransferFundsEntity(),
        TransferFundsAccountsToResponseModel.fromJson({
          "toAccounts": ["4444444444", "5555555555", "6666666666"]
        }));

    expect(
        entity,
        TransferFundsEntity(
            toAccounts: ['4444444444', '5555555555', '6666666666']));
  });
}