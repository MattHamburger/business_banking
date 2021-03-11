import 'package:business_banking/features/investment/model/investment_entity.dart';
import 'package:business_banking/features/investment/model/investment_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Investment View Model', () {
    final viewModel = InvestmentViewModel(
        accountBalance: 1600.00,
        totalGainValue: -45.00,
        totalGainPercent: 43.33);

    test('should properties match', () {
      expect(viewModel.accountBalance, 1600.00);
      expect(viewModel.totalGainValue, -45.00);
      expect(viewModel.totalGainPercent, 43.33);
    });
  });
}
