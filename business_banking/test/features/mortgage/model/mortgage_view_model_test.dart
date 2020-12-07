import 'package:business_banking/features/mortgage/model/mortgage_view_model.dart';
import 'package:business_banking/features/mortgage/model/mortgage_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageViewModel init', () {
    final viewModel = MortgageViewModel(
        mortgageEntity: MortgageEntity(
            escrowBalance: 1234.00,
            feesCharged: 123.45,
            interestRate: 3.25,
            loanNumber: 987654321,
            monthlyAmountDue: 1234.00,
            monthlyPaymentDue: 1609459200,
            outstandingPrincipal: 234567.00));

    expect(viewModel.monthlyAmountDue, '\$1,234.00');
    expect(viewModel.paymentDue, '12/31/2020');
    expect(viewModel.props, [viewModel.monthlyAmountDue, viewModel.paymentDue]);
  });
  test('MortgageViewModel initialize with error', () {
    try {
      MortgageViewModel(mortgageEntity: null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
