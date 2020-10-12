import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:business_banking/features/cash_accounts/bloc/cash_accounts_service_adapter.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = CashAccountsServiceAdapter().createEntity(
        CashAccountsEntity(),
        CashAccountsServiceResponseModel.fromJson({
          'type': 'Employee Checking',
          'lastFour': '6542',
          'balance': 3545.54
        }));

    expect(
        entity,
        CashAccountsEntity(
            name: 'Employee Checking', lastFour: '6542', balance: 3545.54));
  });
}
