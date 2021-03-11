import 'package:business_banking/features/investment/model/investment_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Investment Entiry', () {
    final entity = InvestmentEntity(
        accountBalance: 1600.00,
        totalGainValue: -45.00,
        totalGainPercent: 43.33);

    test('should properties match', () {
      expect(entity.accountBalance, 1600.00);
      expect(entity.totalGainValue, -45.00);
      expect(entity.totalGainPercent, 43.33);

      expect(entity.props, [
        entity.errors,
        entity.accountBalance,
        entity.totalGainValue,
        entity.totalGainPercent,
      ]);
    });

    test('should properties match after merge with errors = null', () {
      entity.merge(errors: null);
      expect(entity.accountBalance, 1600.00);
      expect(entity.totalGainValue, -45.00);
      expect(entity.totalGainPercent, 43.33);
    });
  });
}
