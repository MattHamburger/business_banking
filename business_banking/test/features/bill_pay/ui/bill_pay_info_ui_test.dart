import 'package:business_banking/features/bill_pay/ui/bill_pay_info_presenter.dart';
import 'package:business_banking/features/bill_pay/ui/bill_pay_info_widget.dart';
import 'package:business_banking/features/customer/ui/customer_presenter.dart';
import 'package:business_banking/features/customer/ui/customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('BillPayInfoWidget, contains a presenter', (tester) async {
   Widget testWidget = MaterialApp(home: BillPayInfoWidget());
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(BillPayInfoPresenter), findsOneWidget);
  });
}
