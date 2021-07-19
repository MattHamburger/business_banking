// @dart=2.9
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'integration_test_helpers.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'The Offers card should be displayed in the hub',
    (WidgetTester tester) async {
      await startTest(tester);
      await didWidgetAppear('signInText');
      await tapWidget('login_button_key');
      await didWidgetAppear('OffersHub-success');
    },
  );

  testWidgets(
    'Tapping the Offers card should navigate to the Offers List page',
    (WidgetTester tester) async {
      await startTest(tester);
      await didWidgetAppear('signInText');
      await tapWidget('login_button_key');
      await didWidgetAppear('OffersHub-success');
      await tapWidget('OffersHub-success');
      await didWidgetAppear('OffersList-success');
    },
  );

  testWidgets(
    'Tapping the back button should navigate from the Offers List page back to '
    'the hub',
    (WidgetTester tester) async {
      await startTest(tester);
      await didWidgetAppear('signInText');
      await tapWidget('login_button_key');
      await didWidgetAppear('OffersHub-success');
      await tapWidget('OffersHub-success');
      await didWidgetAppear('OffersList-success');
      await tapWidget('OffersList-appbar-back-button');
      await didWidgetAppear('OffersHub-success');
    },
  );
}
