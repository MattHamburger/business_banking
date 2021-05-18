// @dart = 2.9
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'integration_test_helpers.dart';

//flutter drive --driver=integration_test/integration_test_driver.dart --target=integration_test/integration_test.dart

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Banking App Integration Tests:', () {
    final signInText = 'signInText';
    final loginButton = 'login_button_key';

    // hub
    final hubAppBar = find.byKey(Key('CAappBarName'));

    // Bill pay hub card
    final billPayCardTitle = find.byKey(Key('Bill-Pay-Card-Title'));
    final billPayCardSubtitle = find.byKey(Key('Bill-Pay-Card-Subtitle'));
    final payBillButton = 'Bill-Pay-Card-Button';
    final billPayBackButton = 'Bill-Pay-Back-Button';

    // Bill pay screen
    final billPayBillList = find.byKey(Key('Bill-Pay-Bill-List'));
    getBillPayCard(index) {
      return 'Bill-Pay-Screen-Card-$index';
    }
    final billPayPaymentButton = 'Bill-Pay-Confirm-Button';
    final billPaySuccessDialog = 'Bill-Pay-Success-Dialog';
    final billPaySuccessDialogPayAnother = 'Bill-Pay-Success-Dialog-Pay-Another';
    final billPaySuccessDialogHub = 'Bill-Pay-Success-Dialog-Hub';

    /// These will only pass with the specific JSON included in the Mockoon folder
    testWidgets('Integration test', (WidgetTester tester) async {
      await startTest(tester);

      //LoginScreen, screen is displayed
      await didWidgetAppear(signInText);
      await didTextAppear('Sign In');

      //navigated to and app bar is displayed
      await tapWidget(loginButton);
      expect(tester.widget<Text>(hubAppBar).data, 'Business Banking');

      //Bill Pay, bill pay card showing
      expect(tester.widget<Text>(billPayCardTitle).data, 'Pay Bills');
      expect(tester.widget<Text>(billPayCardSubtitle).data, 'You have 4 bill(s) due');

      //Bill Pay, navigate to and display bill pay screen
      await tapWidget(payBillButton);
      await didTextAppear('PAY BILLS');
      await didTextAppear('Pay a bill');

      //Bill Pay, go back to hub with back button
      await tapWidget(billPayBackButton);
      await tapWidget(payBillButton);

      //Bill Pay, select bills
      await tapWidget(getBillPayCard(0));
      await tapWidget(getBillPayCard(1));
      await tapWidget(getBillPayCard(1));

      await tester.drag(billPayBillList, const Offset(0.0, -500));
      await tester.pump();
      
      await tapWidget(getBillPayCard(3));
      //Bill Pay, pay bill
      await tapWidget(billPayPaymentButton);
      await didWidgetAppear(billPaySuccessDialog);

      //Bill Pay, pay another bill
      // await tapWidget(payBillButton);
      await tapWidget(billPaySuccessDialogPayAnother);
      await tester.pumpAndSettle();
      await tapWidget(getBillPayCard(2));
      await tapWidget(billPayPaymentButton);
      await didWidgetAppear(billPaySuccessDialog);
      //Bill Pay, back to hub
      await tapWidget(billPaySuccessDialogHub);

    });
  });
}
