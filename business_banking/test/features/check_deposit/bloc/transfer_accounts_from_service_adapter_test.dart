import 'package:business_banking/features/transfer_funds/api/accounts/transfer_accounts_from_response_model.dart';
import 'package:business_banking/features/transfer_funds/bloc/transfer_accounts_from_service_adapter.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity for from accounts is created by service adapter', () async {
    final serviceAdapter = TransferFundsAccountsFromServiceAdapter();
    final entity = serviceAdapter.createEntity(
        TransferFundsEntity(),
        TransferFundsAccountsFromResponseModel.fromJson({
          "fromAccounts": ["1111111111", "2222222222", "3333333333"]
        }));

    expect(
        entity.fromAccounts,
        TransferFundsEntity(
            fromAccounts: ['1111111111', '2222222222', '3333333333']).fromAccounts);

    final initialEntity = TransferFundsEntity();
    final TransferFundsEntity entity1 = await serviceAdapter.query(initialEntity);

    expect(
        entity1.fromAccounts,
        TransferFundsEntity(
            fromAccounts: ['1111111111', '2222222222', '3333333333']).fromAccounts);
  });
}