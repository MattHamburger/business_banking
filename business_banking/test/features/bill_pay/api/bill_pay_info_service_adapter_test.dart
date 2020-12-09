import 'package:business_banking/features/bill_pay/api/models/bill_pay_info_response_model.dart';
import 'package:business_banking/features/bill_pay/bloc/bill_pay_info_service_adapter.dart';
import 'package:business_banking/features/bill_pay/model/entities/account_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/bill_pay_info_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/biller_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/rules_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = BillPayInfoServiceAdapter().createEntity(
      BillPayInfoEntity(),
      BillPayInfoResponseModel.fromJson(billPayInfoServiceResponseMap),
    );

    expect(
      entity,
      BillPayInfoEntity(
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
      ),
    );
  });
}

const Map<String, dynamic> billPayInfoServiceResponseMap = {
  ...rulesMap,
  ...billersMap,
  ...accountsMap,
};

const Map<String, dynamic> rulesMap = {
  "rules": {
    "memo_limit": 256,
    "payment_min": 1.00,
    "payment_max": 100000.00,
  }
};

const Map<String, dynamic> billersMap = {
  "billers": [
    {
      "biller_name": "Gas Company",
      "account_number": "9582",
    },
    {
      "biller_name": "Internet Company",
      "account_number": "6237",
    },
    {
      "biller_name": "Water Company",
      "account_number": "6092",
    },
    {
      "biller_name": "Electric Company",
      "account_number": "6129",
    },
  ],
};

const Map<String, dynamic> accountsMap = {
  "accounts": [
    {
      "account_title": "Checking Account",
      "account_number": "6542",
      "account_balance": 3545.54,
      "account_status": "Active"
    },
    {
      "account_title": "Savings Account",
      "account_number": "6543",
      "account_balance": 0.02,
      "account_status": "Active"
    }
  ],
};
