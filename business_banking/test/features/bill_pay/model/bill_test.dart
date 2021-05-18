// @dart=2.9
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bill with null date should use current date', () {
    Bill nullDate = Bill.fromJson({
      "id": 125,
      "payee": "City of Columbus",
      "memo": "Gas bill",
      "amount": 32,
      "due": null
    });
    DateTime nullDateNow = nullDate.due;
    DateTime now = DateTime.now();
    DateTime nullDateNowNoTime = DateTime(nullDateNow.year, nullDateNow.month, nullDateNow.day);
    DateTime nowNoTime = DateTime(now.year, now.month, now.day);
    expect(nullDateNowNoTime, nowNoTime);
  });
}