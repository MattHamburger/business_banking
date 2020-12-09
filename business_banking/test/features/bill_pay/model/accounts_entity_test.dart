import 'package:business_banking/features/bill_pay/model/entities/account_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Account Entity properties match', () {
    final entity = AccountEntity(
      accountTitle: "Checking Account",
      accountNumber: "6542",
      accountBalance: 3545.54,
      accountStatus: "Active",
    );

    expect(entity.accountTitle, "Checking Account");
    expect(entity.accountNumber, "6542");
    expect(entity.accountBalance, 3545.54);
    expect(entity.accountStatus, "Active");
  });

  test('Account Entity merge with errors = null', () {
    final entity = AccountEntity(
      accountTitle: "Checking Account",
      accountNumber: "6542",
      accountBalance: 3545.54,
      accountStatus: "Active",
    );
    entity.merge(errors: null);

    expect(entity.accountTitle, "Checking Account");
    expect(entity.accountNumber, "6542");
    expect(entity.accountBalance, 3545.54);
    expect(entity.accountStatus, "Active");

  });
}
