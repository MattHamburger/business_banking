import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'integration_test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
      "After user tap on investment account, go to the investment detail page which contains the details of investment account"
      "and then navigate back to the hub page", (WidgetTester tester) async {
    await startTest(tester);
    await didWidgetAppear('signInText');
    await tapWidget('login_button_key');
    // hub
    final hubAppBar = find.byKey(Key('CAappBarName'));
    expect(tester.widget<Text>(hubAppBar).data, 'Business Banking');

    //Investment Accounts Screen, displaying Card Data
    await didWidgetAppear('investmentCard');
    await didTextAppear('Investment Account Balance');
    await didTextAppear('Account value / Today\'s net change');

    await tapWidget('investmentCard');
    await didTextAppear('Account Balance');

    await didTextAppear("Symbol");
    await didTextAppear("Price");

    await didWidgetAppear('item-list-key');

    final gesture =
        await tester.startGesture(Offset(0, 300)); //Position of the scrollview
    await gesture.moveBy(Offset(0, -200)); //How much to scroll by

    final backButton = find.byKey(Key('investment-detail-backButton'));

    await tapWithFinder(backButton);

    await tester.pumpAndSettle();

    expect(backButton, findsNothing);
  });

  //testWidgets('description', (WidgetTester tester) async {});
}
