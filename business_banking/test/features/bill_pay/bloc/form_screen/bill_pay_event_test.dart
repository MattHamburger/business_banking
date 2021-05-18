// @dart=2.9
import 'package:business_banking/features/bill_pay/bloc/form_screen/bill_pay_event.dart';
import 'package:test/test.dart';

void main() {
  group('Bill Pay Event', () {
    test('props should match and stringify be true on SelectBillEvent',
            () {
          final event = SelectBillEvent(0);
          expect(event.props, [0]);
          expect(event.stringify, true);
        });
    test('props should be empty and stringify be true on ConfirmBillPaid',
            () {
          final event = ConfirmBillPayedEvent();
          expect(event.props, []);
          expect(event.stringify, true);
        });
    test('props should be empty and stringify be true on PayButtonClickEvent',
            () {
          final event = PayButtonClickEvent();
          expect(event.props, []);
          expect(event.stringify, true);
        });
  });
}
