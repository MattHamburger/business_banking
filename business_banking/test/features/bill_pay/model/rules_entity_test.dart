import 'package:business_banking/features/bill_pay/model/entities/rules_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RulesEntity properties match', () {
    final entity = RulesEntity(
        paymentMax: 10000, paymentMin: 1, memoLimit: 256);
    expect(entity.paymentMax, 10000);
    expect(entity.paymentMin, 1);
    expect(entity.memoLimit, 256);

    expect(entity.toString(), "256 1.0 10000.0");
  });

  test('RulesEntity merge with errors = null', () {


    final entity = RulesEntity(
        paymentMax: 10000, paymentMin: 1, memoLimit: 256);

    entity.merge(errors: null);
    expect(entity.paymentMax, 10000);
    expect(entity.paymentMin, 1);
    expect(entity.memoLimit, 256);

  });
}
