import 'package:business_banking/features/cash_accounts/api/cash_accounts_service.dart';
import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CashAccountsService success', () async {
    final service = CashAccountsService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        CashAccountsServiceResponseModel.fromJson({
          'type': 'Employee Checking',
          'lastFour': '6542',
          'balance': 3545.54
        }));
  });
}
