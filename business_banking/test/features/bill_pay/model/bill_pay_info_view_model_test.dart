import 'package:business_banking/features/bill_pay/model/entities/account_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/biller_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/rules_entity.dart';
import 'package:business_banking/features/bill_pay/model/view_models/bill_pay_info_view_model.dart';
import 'package:business_banking/features/customer/model/customer_view_model.dart';
import 'package:business_banking/features/customer/model/customer_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  RulesEntity rules;
  AccountEntity account1;
  AccountEntity account2;
  BillerEntity biller1;
  BillerEntity biller2;
  BillerEntity biller3;
  BillerEntity biller4;

  setUp(() {
    rules = RulesEntity(
      memoLimit: 256,
      paymentMax: 100000.00,
      paymentMin: 1.00,
    );
    account1 = AccountEntity(
      accountTitle: "Checking Account",
      accountNumber: "6542",
      accountBalance: 3545.54,
      accountStatus: "Active",
    );
    account2 = AccountEntity(
      accountTitle: "Savings Account",
      accountNumber: "6543",
      accountBalance: 0.02,
      accountStatus: "Active",
    );

    biller1 = BillerEntity(
      billerName: "Gas Company",
      accountNumber: "9582",
    );
    biller2 = BillerEntity(
      billerName: "Internet Company",
      accountNumber: "6237",
    );
    biller3 = BillerEntity(
      billerName: "Water Company",
      accountNumber: "6092",
    );
    biller4 = BillerEntity(
      billerName: "Electric Company",
      accountNumber: "6129",
    );
  });

  test('BillPayInfoViewModel initialize', () {
    final viewModel = BillPayInfoViewModel(
      rules: rules,
      accounts: [
        account1,
        account2,
      ],
      billers: [
        biller1,
        biller2,
        biller3,
        biller4,
      ],
    );
    expect(
        viewModel.rules,
        RulesEntity(
          memoLimit: 256,
          paymentMax: 100000.00,
          paymentMin: 1.00,
        ));

    expect(viewModel.accounts, [
      AccountEntity(
        accountTitle: "Checking Account",
        accountNumber: "6542",
        accountBalance: 3545.54,
        accountStatus: "Active",
      ),
      AccountEntity(
        accountTitle: "Savings Account",
        accountNumber: "6543",
        accountBalance: 0.02,
        accountStatus: "Active",
      )
    ]);
    expect(viewModel.props, [
      viewModel.billers,
      viewModel.accounts,
      viewModel.rules,
      viewModel.serviceStatus,
      viewModel.dataStatus
    ]);

    expect(viewModel.toString(), "Billers: [Gas Company 9582, Internet Company 6237, Water Company 6092, Electric Company 6129], Accounts: [Checking Account 6542 3545.54 Active, Savings Account 6543 0.02 Active], Rules: 256 1.0 100000.0, ServiceStatus: ServiceStatus.unknown, DataStatus: DataStatus.unknown");
  });
}
