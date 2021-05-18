// @dart=2.9
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BillPay Entity', () {

    var allBills = [
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
    ];

    final tEntity = BillPayEntity(
      allBills: allBills,
      selectedBillIndex: -1,
      payStatus: PayBillStatus.none,
      referenceNumber: '',
      errors: []
    );

    test('properties should match', () {
      expect(tEntity.allBills, allBills);
      expect(tEntity.selectedBillIndex, -1);
      expect(tEntity.payStatus, PayBillStatus.none);
      expect(tEntity.referenceNumber, '');
    });

    test('props should match', () async {
      expect(tEntity.props, [tEntity.errors,
        tEntity.allBills, tEntity.selectedBillIndex,
        tEntity.payStatus, tEntity.referenceNumber]);
    });

    test('merge func should return new Entity with updated data', () async {
      var newBills = allBills;
      newBills[0] = Bill.fromJson({
        "id": 200,
        "payee": "APE",
        "memo": "Electricity bill",
        "amount": 2160.88,
        "due": 1622793600001
      });
      var newEntity = tEntity.merge(allBills: newBills, selectedBillIndex: 0,
          payStatus: PayBillStatus.success, referenceNumber: '1010101010');
      expect(newEntity.allBills, newBills);
      expect(newEntity.selectedBillIndex, 0);
      expect(newEntity.payStatus, PayBillStatus.success);
      expect(newEntity.referenceNumber, '1010101010');
    });
  });
}
