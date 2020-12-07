import 'package:business_banking/features/mortgage/api/mortgage_service_response_model.dart';
import 'package:business_banking/features/mortgage/bloc/mortgage_service_adaptor.dart';
import 'package:business_banking/features/mortgage/model/mortgage_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = MortgageServiceAdapter().createEntity(
        MortgageEntity(),
        MortgageServiceResponseModel.fromJson({
          "monthly_payment_due": 1609459200,
          "monthly_amount_due": 1234.00,
          "outstanding_principal": 234567.00,
          "interest_rate": 3.25,
          "escrow_balance": 1234.00,
          "fees_charged": 123.45,
          "loan_number": 987654321
        }));

    expect(
        entity,
        MortgageEntity(
          escrowBalance: 1234.00,
          feesCharged: 123.45,
          interestRate: 3.25,
          loanNumber: 987654321,
          monthlyAmountDue: 1234.00,
          monthlyPaymentDue: 1609459200,
        ));
  });
}
