import 'package:flutter_driver/flutter_driver.dart';
import 'package:intl/intl.dart';
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
    final customerTileText = find.byValueKey('HCTileText');
    final customerTileButton = find.byValueKey('HCTileButton');
    final customerDetailAppBar = find.byValueKey('HCDappBarName');
    final customerDetailName = find.byValueKey('HCDname');
    final customerDetailWeather = find.byValueKey('HCDweather');
    final customerDetailAddress = find.byValueKey('HCDaddress');
    final customerBackButton = find.pageBack();
    
    // transfer funds widgets
    // transfer funds screen widgets
    final transferFundsButton = find.byValueKey('transfer_funds_button');
    final transferFundsBarTitle = find.byValueKey('transfer_funds_bar_title');
    final transferFromAccountLabel = find.byValueKey('from_label');
    final fromAccountDropdown = find.byType('FromAccountsDropDown');
    final toLabel = find.byValueKey('to_label');
    final toAccountDropdown = find.byType('ToAccountsDropDown');
    final amountLabel = find.byValueKey('amount_label');
    final amountTextField = find.byValueKey('amount_text_field');
    final dateLabel = find.byValueKey('date_label');
    final dateTextField = find.byValueKey('date_text_field');
    final submitTransferButton = find.byValueKey('submit_transfer_button');
    // transfer confirmation screen widgets
    final transferConfirmationBarTitle = find.byValueKey('transfer_confirmation_bar_title');
    final transferConfirmationTitle = find.byValueKey('transaction_confirmation_title');
    final transferConfirmationIdLabel = find.byValueKey('transfer_confirmation_id_label');
    final transferConfirmationIdField = find.byValueKey('transfer_confirmation_id_field');
    final transferConfirmationDateLabel = find.byValueKey('transfer_confirmation_date_label');
    final transferConfirmationDateField = find.byValueKey('transfer_confirmation_date_field');
    final transferConfirmationFromAccountLabel = find.byValueKey('transfer_confirmation_from_account_label');
    final transferConfirmationFromAccountField = find.byValueKey('transfer_confirmation_from_account_field');
    final transferConfirmationToAccountLabel = find.byValueKey('transfer_confirmation_to_account_label');
    final transferConfirmationToAccountField = find.byValueKey('transfer_confirmation_to_account_field');
    final transferConfirmationAmountLabel = find.byValueKey('transfer_confirmation_amount_label');
    final transferConfirmationAmountField = find.byValueKey('transfer_confirmation_amount_field');
    final transferConfirmationTypeLabel = find.byValueKey('transfer_confirmation_type_label');
    final transferConfirmationTypeField = find.byValueKey('transfer_confirmation_type_field');
    final anotherTransferButton = find.byValueKey('make_another_transfer_button');

    /// Bill Pay Info Keys
    final billPayInfoScreenTitle = find.byValueKey('bill_pay_info_screen_title');
    final toBillerTitle = find.byValueKey("to_biller_title");
    final gasCompanyLabel = find.byValueKey("biller: Gas Company");
    final gasCompanyAccountNumberLabel = find.byValueKey("billerAccountNumber: 9582");
    final internetCompanyLabel = find.byValueKey("biller: Internet Company");
    final internetCompanyAccountNumberLabel = find.byValueKey("billerAccountNumber: 6237");
    final waterCompanyLabel = find.byValueKey("biller: Water Company");
    final waterCompanyAccountNumberLabel = find.byValueKey("billerAccountNumber: 6092");
    final electricCompanyLabel = find.byValueKey("biller: Electric Company");
    final electricCompanyAccountNumberLabel = find.byValueKey("billerAccountNumber: 6129");
    final submitBillPayButtonFinder = find.byValueKey("submit_bill_pay");
    final submitBillPayLabel = find.byValueKey("submit_bill_pay_label");
    /// End Bill Pay Info Keys

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


    /// Begin Bill Pay Info Tests

    test("BillPayInfoScreen title is displayed", () async {
      expect(await driver.getText(billPayInfoScreenTitle), "Bill Pay");
    });

    test("To Biller title is displayed", () async {
      expect(await driver.getText(toBillerTitle), "To Biller: ");
    });

    test("Gas company info is displayed", () async {
      expect(await driver.getText(gasCompanyLabel), "Gas Company");
      expect(await driver.getText(gasCompanyAccountNumberLabel), "9582");
    });

    test("Internet company info is displayed", () async {
      expect(await driver.getText(internetCompanyLabel), "Internet Company");
      expect(await driver.getText(internetCompanyAccountNumberLabel), "6237");
    });

    test("Water company info is displayed", () async {
      expect(await driver.getText(waterCompanyLabel), "Water Company");
      expect(await driver.getText(waterCompanyAccountNumberLabel), "6092");
    });

    test("Electric company info is displayed", () async {
      expect(await driver.getText(electricCompanyLabel), "Electric Company");
      expect(await driver.getText(electricCompanyAccountNumberLabel), "6129");
    });

    test("Submit button text is displayed", () async {

      final scrollViewFinder = find.byValueKey("scroll_view");

      await driver.scrollUntilVisible(
        scrollViewFinder,
        submitBillPayButtonFinder,
        dyScroll: -100.0,
      );

      print("scrolling complete");
      expect(await driver.getText(submitBillPayLabel), "Submit");
    });
    /// End Bill Pay Info Tests


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

    test('AccountDetailScreen, deposit hold ammount is displayed on card', () async {
      expect(await driver.getText(depHold), '\$0.00');
    });

    test('CashAccountScreen, check to find correct app bar', () async {
      await driver.tap(backButton);
      await driver.waitForAbsent(accountDetailAppBar);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });

    test('CustomerScreen, Hello Joe is displayed on tile', () async {
      expect(await driver.getText(customerTileText), 'Hello Mr. Joe A');
    });

    test('CustomerDetailScreen, navigate to and app bar is displayed', () async {
      await driver.tap(customerTileButton);
      await driver.waitForAbsent(customerTileButton);
      expect(await driver.getText(customerDetailAppBar), 'Hello Customer');
    });

    test('CustomerDetailScreen, name weather address is displayed on screen', () async {
      expect(await driver.getText(customerDetailName), 'Hello Mr. Joe A');
      expect(await driver.getText(customerDetailWeather), 'sunny');
      expect(await driver.getText(customerDetailAddress), '1234 ABCD Rd, City, State 00000');
    });

    test('CustomerScreen, check to find correct app bar', () async {
      await driver.tap(customerBackButton);
      await driver.waitForAbsent(customerDetailAppBar);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });

    // transfer funds feature
    test('TransferFundsScreen, navigated to and app bar is displayed', () async {
      await driver.tap(transferFundsButton);
      await driver.waitForAbsent(transferFundsButton);
      expect(await driver.getText(transferFundsBarTitle), 'Transfer Funds');
    });

    test('TransferFundsScreen, check from label is displayed', () async {
      expect(await driver.getText(transferFromAccountLabel), 'From');
    });

    test('TransferFundsScreen, check to label is displayed', () async {
      expect(await driver.getText(toLabel), 'To');
    });

    test('TransferFundsScreen, check amount label is displayed', () async {
      expect(await driver.getText(amountLabel), 'Amount');
    });

    test('TransferFundsScreen, check amount field is displayed', () async {
      expect(await driver.getText(amountTextField), '');
    });

    test('TransferFundsScreen, check date label is displayed', () async {
      expect(await driver.getText(dateLabel), 'Transfer date');
    });

    test('TransferFundsScreen, check date field is displayed', () async {
      expect(await driver.getText(dateTextField), DateFormat('MM/dd/yyyy').format(DateTime.now()));
    });

    test('TransferFundsScreen, fill transfer form and navigate to confirmation screen', () async {
      // select from account
      await driver.tap(fromAccountDropdown);
      await driver.tap(find.text('1111111111'));
      await driver.waitFor(find.text('1111111111'));
      // select data
      await driver.tap(dateTextField);
      await driver.tap(find.text('16'));
      await driver.tap(find.text('OK'));
      // enter amount 10.5
      await driver.tap(amountTextField);
      await driver.enterText('10.5');
      // choose to account
      await driver.tap(toAccountDropdown);
      await driver.tap(find.text('5555555555'));
      await driver.waitFor(find.text('5555555555'));
      await driver.waitFor(find.text('10.5'));
    });

    test('TransferConfirmationScreen, navigated to and app bar is displayed', () async {
      await driver.tap(submitTransferButton);
      await driver.waitForAbsent(submitTransferButton);
      expect(await driver.getText(transferConfirmationBarTitle), 'Transfer Confirmation');
    });

    test('TransferConfirmationScreen, check all transfer confirmation data displayed', () async {
      DateTime now = DateTime.now();
      int month = now.month;
      int year = now.year;
      String date = '$month/16/$year';
      expect(await driver.getText(transferConfirmationTitle), 'Transaction');
      expect(await driver.getText(transferConfirmationIdLabel), 'Confirmation #:');
      expect(await driver.getText(transferConfirmationIdField), '123456789');
      expect(await driver.getText(transferConfirmationDateLabel), 'Transfer Date');
      expect(await driver.getText(transferConfirmationDateField), date);
      expect(await driver.getText(transferConfirmationFromAccountLabel), 'From');
      expect(await driver.getText(transferConfirmationFromAccountField), '1111111111');
      expect(await driver.getText(transferConfirmationToAccountLabel), 'To');
      expect(await driver.getText(transferConfirmationToAccountField), '5555555555');
      expect(await driver.getText(transferConfirmationAmountLabel), 'Amount');
      expect(await driver.getText(transferConfirmationAmountField), '\$10.5');
      expect(await driver.getText(transferConfirmationTypeLabel), 'Type');
      expect(await driver.getText(transferConfirmationTypeField), 'Transfer');
    });

    test('TransferFundsScreen, navigating back from TransferConfirmation screen by pushing Make another transfer button', () async {
      await driver.tap(anotherTransferButton);
      await driver.waitForAbsent(anotherTransferButton);
      expect(await driver.getText(transferFundsBarTitle), 'Transfer Funds');
    });

    test('TransferFundsScreen, check transfer form was reset', () async {
      DateTime now = DateTime.now();
      String date = '${now.month}/${now.day}/${now.year}';
      await driver.waitFor(find.text('Select a From Account'));
      await driver.waitFor(find.text('Select a To Account'));
      expect(await driver.getText(amountTextField), '');
      expect(await driver.getText(dateTextField), date);
    });

    test('CashAccountScreen, navigating back from TransferFundsScreen, check to find correct app bar', () async {
      await driver.tap(find.pageBack());
      await driver.waitForAbsent(transferFundsBarTitle);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });
  });
}
