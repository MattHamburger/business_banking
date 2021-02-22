import 'package:business_banking/features/mobile_check_deposit/api/accounts/check_deposit_to_accounts_response_model.dart';
import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_accounts_to_service_adapter.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity for check deposit to accounts is created by service adapter', () {
    final entity = CheckDepositToAccountServiceAdapter().createEntity(
        CheckDepositEntity(),
        CheckDepositToAccountResponseModel.fromJson({
          "toAccounts": ["4444444444", "5555555555", "6666666666"]
        }));

    expect(
        entity,
        CheckDepositEntity(
            toAccounts: ['4444444444', '5555555555', '6666666666']));
  });
}