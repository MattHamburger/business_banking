// @dart=2.9
import 'package:business_banking/features/bill_pay/api/first_card/bill_pay_card_response_model.dart';
import 'package:business_banking/features/bill_pay/bloc/first_card/bill_pay_card_service_adapter.dart';
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_entity.dart';
import 'package:test/test.dart';

void main() {
  group('Bill Pay Card Service Adapter Test', () {
    final tEntity = BillPayCardEntity(billsDue: 4);

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

    test('should receive a json response and return BillPayCard entity',
            () async {
          final entity = BillPayCardServiceAdapter().createEntity(
              BillPayCardEntity(),
              BillPayCardResponseModel.fromJson(tJsonResponse));
          expect(entity, tEntity);
        });
  });
}
