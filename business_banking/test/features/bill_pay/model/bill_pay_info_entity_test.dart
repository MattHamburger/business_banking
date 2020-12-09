import 'package:business_banking/features/bill_pay/model/entities/account_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/bill_pay_info_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/biller_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/rules_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Biller Entity properties', () {
    final entity = BillPayInfoEntity(
      rules: RulesEntity(
        memoLimit: 256,
        paymentMax: 100000.00,
        paymentMin: 1.00,
      ),
      accounts: [
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
      ],
      billers: [
        BillerEntity(
          billerName: "Gas Company",
          accountNumber: "9582",
        ),
        BillerEntity(
          billerName: "Internet Company",
          accountNumber: "6237",
        ),
        BillerEntity(
          billerName: "Water Company",
          accountNumber: "6092",
        ),
        BillerEntity(
          billerName: "Electric Company",
          accountNumber: "6129",
        ),
      ],
    );

    expect(entity.rules.toString(), "256 1.0 100000.0");
    expect(entity.accounts[1].toString(), "Savings Account 6543 0.02 Active");
    expect(entity.billers[3].toString(), "Electric Company 6129");
  });

  test('BillPayInfo Entity merge with errors = null', () {
    final entity = BillPayInfoEntity(
      rules: RulesEntity(
        memoLimit: 256,
        paymentMax: 100000.00,
        paymentMin: 1.00,
      ),
      accounts: [
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
      ],
      billers: [
        BillerEntity(
          billerName: "Gas Company",
          accountNumber: "9582",
        ),
        BillerEntity(
          billerName: "Internet Company",
          accountNumber: "6237",
        ),
        BillerEntity(
          billerName: "Water Company",
          accountNumber: "6092",
        ),
        BillerEntity(
          billerName: "Electric Company",
          accountNumber: "6129",
        ),
      ],
    );
    entity.merge(errors: null);

    expect(entity.rules.toString(), "256 1.0 100000.0");
    expect(entity.accounts[1].toString(), "Savings Account 6543 0.02 Active");
    expect(entity.billers[3].toString(), "Electric Company 6129");

  });
}
