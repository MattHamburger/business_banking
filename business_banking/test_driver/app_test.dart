import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Banking App Driver Tests:', () {
    final signInText = find.byValueKey('signInText');
    final loginButton = find.byValueKey('login_button_key');
    final accountCard = find.byValueKey('accountCard1');
    final cashAccountBalance = find.byValueKey('balance');
    final cashAccountAppBar = find.byValueKey('CAappBarName');
    final backButton = find.byValueKey('backButton');
    final accountDetailAppBar = find.byValueKey('ADappBarL4');
    final bigBalance = find.byValueKey('bigBalance');
    final depHold = find.byValueKey('depHold');
    final btnBillPay = find.byValueKey('PayBtn');
    final billPayAppBar = find.byValueKey('CBillPayAppBarTitle');
    final btnOK = find.byValueKey('BtnOK');
    final btnPayBill = find.byValueKey('BtnPayBill');
    final billPayBackBtn = find.byValueKey('BillPayBackBtn');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    // These will only pass with the specific JSON included in the Mockoon folder

    test('LoginScreen, screen is displayed', () async {
      expect(await driver.getText(signInText), 'Sign In');
    });

    test('CashAccountsScreen, navigated to and app bar is displayed', () async {
      await driver.tap(loginButton);
      await driver.waitForAbsent(loginButton);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });

    test('CashAccountsScreen, account balance is displayed on card', () async {
      expect(await driver.getText(cashAccountBalance), '\$3545.54');
    });

    test('AccountDetailScreen, app bar is displayed', () async {
      await driver.tap(accountCard);
      expect(await driver.getText(accountDetailAppBar), '*6542');
    });

    test('AccountDetailScreen, account balance is displayed', () async {
      expect(await driver.getText(bigBalance), '\$3545.54');
    });

    test('AccountDetailScreen, deposit hold ammount is displayed on card',
        () async {
      expect(await driver.getText(depHold), '\$0.00');
    });

    test('CashAccountScreen, check to find correct app bar', () async {
      await driver.tap(backButton);
      await driver.waitForAbsent(accountDetailAppBar);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });

    test('Bill Pay Screen, navigated to and app bar is displayed', () async {
      await driver.tap(btnPayBill);
      await driver.waitForAbsent(btnPayBill);
      expect(await driver.getText(billPayAppBar), 'Bill Pay');
    });

    test('Tap on Pay, Alert should be displayed', () async {
      await driver.tap(btnBillPay);
      await driver.tap(btnOK);
      await driver.tap(billPayBackBtn);
    });
  });
}
