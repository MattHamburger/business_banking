import 'package:flutter_test/flutter_test.dart';

import 'package:business_banking/features/mortgage/model/mortgage_entity.dart';

void main() {
  test('CustomerEntity properties', () {
    final entity = MortgageEntity(
        escrowBalance: 1234.00,
        feesCharged: 123.45,
        interestRate: 3.25,
        loanNumber: 987654321,
        monthlyAmountDue: 1234.00,
        monthlyPaymentDue: 1609459200,
        outstandingPrincipal: 234567.00);
    expect(entity.monthlyPaymentDue, 1609459200);
    expect(entity.monthlyAmountDue, "1234.00");
    expect(entity.outstandingPrincipal, 234567.00);
    expect(entity.interestRate, 3.25);
    expect(entity.escrowBalance, 1234.00);
    expect(entity.loanNumber, 987654321);
    expect(entity.feesCharged, 123.45);
    expect(entity.props, [
      entity.errors,
      entity.monthlyAmountDue,
      entity.monthlyPaymentDue,
      entity.outstandingPrincipal,
      entity.interestRate
    ]);
  });

  test('Mortgage merge with errors = null', () {
    final entity = MortgageEntity(
        escrowBalance: 1234.00,
        feesCharged: 123.45,
        interestRate: 3.25,
        loanNumber: 987654321,
        monthlyAmountDue: 1234.00,
        monthlyPaymentDue: 1609459200,
        outstandingPrincipal: 234567.00);
    entity.merge(errors: null);
    expect(entity.monthlyPaymentDue, 1609459200);
    expect(entity.monthlyAmountDue, "1234.00");
    expect(entity.outstandingPrincipal, 234567.00);
    expect(entity.interestRate, 3.25);
    expect(entity.escrowBalance, 1234.00);
    expect(entity.loanNumber, 987654321);
    expect(entity.feesCharged, 123.45);
  });
}
