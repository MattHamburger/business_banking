import 'package:business_banking/features/mortgage/api/mortgage_service.dart';
import 'package:business_banking/features/mortgage/api/mortgage_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageService success', () async {
    final service = MortgageService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        MortgageServiceResponseModel.fromJson({
          "monthly_payment_due": 1609459200,
          "monthly_amount_due": 1234.00,
          "outstanding_principal": 234567.00,
          "interest_rate": 3.25,
          "escrow_balance": 1234.00,
          "fees_charged": 123.45,
          "loan_number": 987654321
        }));
  });
}
