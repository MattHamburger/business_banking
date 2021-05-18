// @dart=2.9
import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_retrieval_response_model.dart';
import 'package:business_banking/features/bill_pay/bloc/form_screen/bill_pay_retrieval_service_adapter.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_entity.dart';
import 'package:test/test.dart';

void main() {
  group('Bill Pay Retrieval Service Adapter Test', () {
    final tEntity = BillPayEntity(
        allBills: [
          Bill.fromJson({
            "id": 123,
            "payee": "AEP",
            "memo": "Electric bill",
            "amount": 216.88,
            "due": 1622793600000
          }),
          Bill.fromJson({
            "id": 124,
            "payee": "City of Columbus",
            "memo": "Water bill",
            "amount": 59.53,
            "due": 1620039600000
          }),
          Bill.fromJson({
            "id": 125,
            "payee": "City of Columbus",
            "memo": "Gas bill",
            "amount": 32,
            "due": 1621422000000
          }),
          Bill.fromJson({
            "id": 126,
            "payee": "Coinbase",
            "memo": "Monthly Bitcoin splurging",
            "amount": 14228.27,
            "due": 1621753200000
          })
        ],
        selectedBillIndex: -1,
        payStatus: PayBillStatus.none,
        referenceNumber: '');

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

    test('should receive a json response and return BillPay entity',
            () async {
          final entity = BillPayRetrievalServiceAdapter().createEntity(
              BillPayEntity(),
              BillPayRetrievalResponseModel.fromJson(tJsonResponse));
          expect(entity, tEntity);
        });
  });
}
