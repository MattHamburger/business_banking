import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import './integration_test_helpers.dart';

// tests can be launched with the flutter drive command
// use the following command:
// flutter drive --driver=integration_test/integration_test_driver.dart --target=integration_test/news_integration_test.dart
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Banking App Integration Tests:', () {
    final signInText = 'signInText';
    final loginButton = 'login_button_key';

    // hub
    final hubAppBar = find.byKey(Key('CAappBarName'));

    final disclosureButton = find.byKey(Key('disclosureAction0'));

    /// These will only pass with the specific JSON included in the Mockoon folder
    testWidgets('Integration test', (WidgetTester tester) async {
      await startTest(tester);

      //LoginScreen, screen is displayed
      await didWidgetAppear(signInText);

      await didTextAppear('Sign In');

      //navigated to and app bar is displayed
      await tapWidget(loginButton);
      expect(tester.widget<Text>(hubAppBar).data, 'Business Banking');

      //news card is displayed
      await didWidgetAppear('containerListView');
      await didWidgetAppear('builderListView');

      // tapping news card
      await tapWithFinder(disclosureButton);

      // news details screen is displayed
      await didWidgetAppear('NewsDetailsScreenAppBar');

      //title
      await didWidgetAppear('NewsDetailsTitle');

      //author
      await didWidgetAppear('NewsDetailsAuthor');

      //published at
      await didWidgetAppear('NewsDetailsDate');

      //news description/content
      await didWidgetAppear('NewsDetailsDesc');
    });
  });
}
