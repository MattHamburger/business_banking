// @dart=2.9
import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_post_response_model.dart';
import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_post_service.dart';
import 'package:test/test.dart';

void main() {
  BillPayPostService service;

  setUp(() {
    service = BillPayPostService();
  });

  group('BillPayPost Service Test', () {
    final tJsonResponse = {
      "status": "Successful",
      "didSucceed": true,
      "referenceNumber": "987654321"
    };

    test('run without errors', () async {
      final eitherResponse = await service.request();

      expect(eitherResponse.isRight, isTrue);
    });

    test(
        'should return the same response as a response model',
            () async {
          final eitherResponse = await service.request();

          expect(eitherResponse.fold((_) {}, (m) => m),
              BillPayPostResponseModel.fromJson(tJsonResponse));
        });
  });
}
