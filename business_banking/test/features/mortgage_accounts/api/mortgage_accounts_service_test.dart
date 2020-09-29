import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service.dart';
import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mortgage_accounts_mock_service.dart';

void main() {
  test('MortgageAccountsService success', () async {
    final service = MortgageAccountsService();
    expect(service, isA<MortgageAccountsService>());
    final response = service.parseResponse({'type': 'Employee Mortgage', 'lastFour': '7635', 'balance': 7635.23});
    expect(response,
        MortgageAccountsServiceResponseModel.fromJson(
            {'type': 'Employee Mortgage', 'lastFour': '7635', 'balance': 7635.23}));
    expect(response.props, isA<List<Object>>());
  });

  test('MortgageAccountsService success Mock', () async {
    final service = MortgageAccountsMockService();
    expect(
        service.parseResponse({'type': 'Employee Mortgage', 'lastFour': '7635', 'balance': 7635.23}),
        MortgageAccountsServiceResponseModel.fromJson(
            {'type': 'Employee Mortgage', 'lastFour': '7635', 'balance': 7635.23}));
  });
}