import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service_response_model.dart';
import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_service_adapter.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mortgage_accounts_mock_service_adapter.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = MortgageAccountsMockServiceAdapter().createEntity(
        MortgageAccountsEntity(),
        MortgageAccountsServiceResponseModel.fromJson({
          'type': 'Employee Mortgage',
          'lastFour': '7635',
          'balance': 7635.23
        }));

    expect(entity, MortgageAccountsEntity(
      name: 'Employee Mortgage',
      lastFour: '7635',
      balance: 7635.23
    ));
  });

  test('Entity is created by non mock service adapter', () {
    final entity = MortgageAccountsServiceAdapter().createEntity(
        MortgageAccountsEntity(),
        MortgageAccountsServiceResponseModel.fromJson({
          'type': 'Employee Mortgage',
          'lastFour': '7635',
          'balance': 7635.23
        }));

    expect(entity, MortgageAccountsEntity(
        name: 'Employee Mortgage',
        lastFour: '7635',
        balance: 7635.23
    ));
  });
}