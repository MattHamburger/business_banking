import 'package:business_banking/features/bill_pay/model/entities/biller_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Biller Entity properties match', () {
    final entity = BillerEntity(
      billerName: "Gas Company",
      accountNumber: "9582",
    );

    expect(entity.billerName, "Gas Company");
    expect(entity.accountNumber, "9582");
  });

  test('Biller Entity merge with errors = null', () {
    final entity = BillerEntity(
      billerName: "Gas Company",
      accountNumber: "9582",
    );
    entity.merge(errors: null);
    expect(entity.billerName, "Gas Company");
    expect(entity.accountNumber, "9582");
  });
}
