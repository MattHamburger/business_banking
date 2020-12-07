import 'package:business_banking/features/mortgage/model/mortgage_detail_view_model.dart';
import 'package:business_banking/features/mortgage/model/mortgage_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageDetailViewModel initialize', () {
    final viewModel = MortgageDetailViewModel(
        mortgageEntity: MortgageEntity(
      escrowBalance: 1234.00,
      feesCharged: 123.45,
      interestRate: 3.25,
      loanNumber: 987654321,
      monthlyAmountDue: 1234.00,
      monthlyPaymentDue: 1609459200 * 1000,
      outstandingPrincipal: 234567.00,
    ));
    expect(viewModel.escrowBalanceString, '\$1,234.00');
    expect(viewModel.feesChargedString, '\$123.45');
    expect(viewModel.loanNum, '987654321');

    expect(viewModel.props, []);
  });
  test('MortgageDetailViewModel initialize with error', () {
    try {
      MortgageDetailViewModel(mortgageEntity: null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
