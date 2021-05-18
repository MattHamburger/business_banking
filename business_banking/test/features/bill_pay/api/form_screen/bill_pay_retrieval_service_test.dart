// @dart=2.9
import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_retrieval_response_model.dart';
import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_retrieval_service.dart';
import 'package:test/test.dart';

void main() {
  BillPayRetrievalService service;

  setUp(() {
    service = BillPayRetrievalService();
  });

  group('BillPayRetrieval Service Test', () {
    final tJsonResponse = {
      "bills": [
        {
          "id": 123,
          "payee": "AEP",
          "memo": "Electric bill",
          "amount": 216.88,
          "due": 1622793600000
        },
        {
          "id": 124,
          "payee": "City of Columbus",
          "memo": "Water bill",
          "amount": 59.53,
          "due": 1620039600000
        },
        {
          "id": 125,
          "payee": "City of Columbus",
          "memo": "Gas bill",
          "amount": 32,
          "due": 1621422000000
        },
        {
          "id": 126,
          "payee": "Coinbase",
          "memo": "Monthly Bitcoin splurging",
          "amount": 14228.27,
          "due": 1621753200000
        }
      ]
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
              BillPayRetrievalResponseModel.fromJson(tJsonResponse));
        });
  });
}
