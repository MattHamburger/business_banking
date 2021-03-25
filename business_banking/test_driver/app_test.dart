import 'package:flutter_driver/flutter_driver.dart';
import 'package:intl/intl.dart';
import 'package:test/test.dart';

void main() {
  group('Banking App Driver Tests:', () {
    final signInText = find.byValueKey('signInText');
    final loginButton = find.byValueKey('login_button_key');

    /// Cash Accounts - Card 1
    //final cashAccountsCardOne = find.byValueKey('cashAccountsCard1');
    final cashAccountsCardOneLastFourAccountNumber =
        find.byValueKey('cashAccountsCard1AccountNumber');
    final cashAccountsCardOneAccountBalance =
        find.byValueKey('cashAccountsCard1Balance');
    final cashAccountsCardOneAccountType =
        find.byValueKey('cashAccountsCard1AccountType');
    final cashAccountsCardOneAccountStatus =
        find.byValueKey('cashAccountsCard1AccountStatus');

    /// Cash Accounts - Card 2
    //final cashAccountsCardTwo = find.byValueKey('cashAccountsCard2');
    final cashAccountsCardTwoLastFourAccountNumber =
        find.byValueKey('cashAccountsCard2AccountNumber');
    final cashAccountsCardTwoAccountBalance =
        find.byValueKey('cashAccountsCard2Balance');
    final cashAccountsCardTwoAccountType =
        find.byValueKey('cashAccountsCard2AccountType');
    final cashAccountsCardTwoAccountStatus =
        find.byValueKey('cashAccountsCard2AccountStatus');

    final cashAccountAppBar = find.byValueKey('CAappBarName');
    // final backButton = find.byValueKey('backButton');
    // final accountDetailAppBar = find.byValueKey('ADappBarL4');
    // final bigBalance = find.byValueKey('bigBalance');
    // final depHold = find.byValueKey('depHold');
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
    final transferConfirmationBarTitle =
        find.byValueKey('transfer_confirmation_bar_title');
    final transferConfirmationTitle =
        find.byValueKey('transaction_confirmation_title');
    final transferConfirmationIdLabel =
        find.byValueKey('transfer_confirmation_id_label');
    final transferConfirmationIdField =
        find.byValueKey('transfer_confirmation_id_field');
    final transferConfirmationDateLabel =
        find.byValueKey('transfer_confirmation_date_label');
    final transferConfirmationDateField =
        find.byValueKey('transfer_confirmation_date_field');
    final transferConfirmationFromAccountLabel =
        find.byValueKey('transfer_confirmation_from_account_label');
    final transferConfirmationFromAccountField =
        find.byValueKey('transfer_confirmation_from_account_field');
    final transferConfirmationToAccountLabel =
        find.byValueKey('transfer_confirmation_to_account_label');
    final transferConfirmationToAccountField =
        find.byValueKey('transfer_confirmation_to_account_field');
    final transferConfirmationAmountLabel =
        find.byValueKey('transfer_confirmation_amount_label');
    final transferConfirmationAmountField =
        find.byValueKey('transfer_confirmation_amount_field');
    final transferConfirmationTypeLabel =
        find.byValueKey('transfer_confirmation_type_label');
    final transferConfirmationTypeField =
        find.byValueKey('transfer_confirmation_type_field');
    final anotherTransferButton =
        find.byValueKey('make_another_transfer_button');

    final containerListView = find.byValueKey('containerListView');
    final builderListView = find.byValueKey('builderListView');
    final disclosureAction = find.byValueKey('disclosureAction0');
    final newsDetailsScreenAppBar = find.byValueKey('NewsDetailsScreenAppBar');
    final newsDetailsTitle = find.byValueKey('NewsDetailsTitle');
    final newsDetailsAuthor = find.byValueKey('NewsDetailsAuthor');
    final newsDetailsDate = find.byValueKey('NewsDetailsDate');
    final newsDetailsDesc = find.byValueKey('NewsDetailsDesc');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    /// These will only pass with the specific JSON included in the Mockoon folder
    test('Hub is displayed with news widget', () async {
      expect(await driver.getText(signInText), 'Sign In');

      await driver.tap(loginButton);
      await driver.waitForAbsent(loginButton);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');

      await driver.waitForAbsent(containerListView);
      await driver.waitForAbsent(builderListView);
      await driver.tap(disclosureAction);

      await driver.waitForAbsent(newsDetailsScreenAppBar);
      await driver.waitForAbsent(newsDetailsTitle);
      await driver.waitForAbsent(newsDetailsAuthor);
      await driver.waitForAbsent(newsDetailsDate);
      await driver.waitForAbsent(newsDetailsDesc);
    });

    /// These will only pass with the specific JSON included in the Mockoon folder
    test('LoginScreen, screen is displayed', () async {
      expect(await driver.getText(signInText), 'Sign In');
    });

    test('CashAccountsScreen, navigated to and app bar is displayed', () async {
      await driver.tap(loginButton);
      await driver.waitForAbsent(loginButton);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });

    test('CashAccountsScreen, displaying Card 1 Data', () async {
      expect(await driver.getText(cashAccountsCardOneLastFourAccountNumber),
          '...6542');
      expect(await driver.getText(cashAccountsCardOneAccountBalance),
          '\$3,545.54');
      expect(await driver.getText(cashAccountsCardOneAccountType), 'Cash');
      expect(await driver.getText(cashAccountsCardOneAccountStatus), 'Active');
    });

    test('CashAccountsScreen, displaying Card 2 Data', () async {
      expect(await driver.getText(cashAccountsCardTwoLastFourAccountNumber),
          '...6543');
      expect(await driver.getText(cashAccountsCardTwoAccountBalance), '\$0.02');
      expect(await driver.getText(cashAccountsCardTwoAccountType), 'Cash');
      expect(await driver.getText(cashAccountsCardTwoAccountStatus), 'Active');
    });

    test('CustomerScreen, Hello Joe is displayed on tile', () async {
      expect(await driver.getText(customerTileText), 'Hello Mr. Joe A');
    });

    test('CustomerDetailScreen, navigate to and app bar is displayed',
        () async {
      await driver.tap(customerTileButton);
      await driver.waitForAbsent(customerTileButton);
      expect(await driver.getText(customerDetailAppBar), 'Hello Customer');
    });

    test('CustomerDetailScreen, name weather address is displayed on screen',
        () async {
      expect(await driver.getText(customerDetailName), 'Hello Mr. Joe A');
      expect(await driver.getText(customerDetailWeather), 'sunny');
      expect(await driver.getText(customerDetailAddress),
          '1234 ABCD Rd, City, State 00000');
    });

    test('CustomerScreen, check to find correct app bar', () async {
      await driver.tap(customerBackButton);
      await driver.waitForAbsent(customerDetailAppBar);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });

    // transfer funds feature
    test('TransferFundsScreen, navigated to and app bar is displayed',
        () async {
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
      expect(await driver.getText(dateTextField),
          DateFormat('MM/dd/yyyy').format(DateTime.now()));
    });

    test(
        'TransferFundsScreen, fill transfer form and navigate to confirmation screen',
        () async {
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

    test('TransferConfirmationScreen, navigated to and app bar is displayed',
        () async {
      await driver.tap(submitTransferButton);
      await driver.waitForAbsent(submitTransferButton);
      expect(await driver.getText(transferConfirmationBarTitle),
          'Transfer Confirmation');
    });

    test(
        'TransferConfirmationScreen, check all transfer confirmation data displayed',
        () async {
      DateTime now = DateTime.now();
      int month = now.month;
      int year = now.year;
      String date = '$month/16/$year';
      expect(await driver.getText(transferConfirmationTitle), 'Transaction');
      expect(
          await driver.getText(transferConfirmationIdLabel), 'Confirmation #:');
      expect(await driver.getText(transferConfirmationIdField), '123456789');
      expect(
          await driver.getText(transferConfirmationDateLabel), 'Transfer Date');
      expect(await driver.getText(transferConfirmationDateField), date);
      expect(
          await driver.getText(transferConfirmationFromAccountLabel), 'From');
      expect(await driver.getText(transferConfirmationFromAccountField),
          '1111111111');
      expect(await driver.getText(transferConfirmationToAccountLabel), 'To');
      expect(await driver.getText(transferConfirmationToAccountField),
          '5555555555');
      expect(await driver.getText(transferConfirmationAmountLabel), 'Amount');
      expect(await driver.getText(transferConfirmationAmountField), '\$10.5');
      expect(await driver.getText(transferConfirmationTypeLabel), 'Type');
      expect(await driver.getText(transferConfirmationTypeField), 'Transfer');
    });

    test(
        'TransferFundsScreen, navigating back from TransferConfirmation screen by pushing Make another transfer button',
        () async {
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

    test(
        'CashAccountScreen, navigating back from TransferFundsScreen, check to find correct app bar',
        () async {
      await driver.tap(find.pageBack());
      await driver.waitForAbsent(transferFundsBarTitle);
      expect(await driver.getText(cashAccountAppBar), 'Business Banking');
    });
  });
}
