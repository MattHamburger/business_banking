import 'package:business_banking/features/transaction/api/transaction_service.dart';
import 'package:business_banking/features/transaction/api/transaction_service_response_model_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TransactionService success', () async {
    final service = TransactionService();
    final eitherResponse = await service.request();

    expect(eitherResponse.isRight, isTrue);
    expect(
        eitherResponse.fold((_) {}, (m) => m),
        TransactionServiceResponseModelList.fromJson({
          "accountTransactions": [
            {
              "transactionTitle": "Europe Tripe",
              "transactionCategory": "airTravel",
              "transactionAmount": "9.99",
              "transactionId": "0000001",
              "debit": true,
              "payTo": "Merchant1",
              "timestamp": 1618275504
            },
            {
              "transactionTitle": "Cat in the Hat",
              "transactionCategory": "movies",
              "transactionAmount": "9.99",
              "transactionId": "0000002",
              "payTo": "Merchant2",
              "debit": true,
              "timestamp": 1618275504
            },
            {
              "transactionTitle": "Olive Garden",
              "transactionCategory": "restaurant",
              "transactionAmount": "9.99",
              "transactionId": "0000003",
              "debit": true,
              "payTo": "Merchant3",
              "timestamp": 1618275504
            },
            {
              "transactionTitle": "Starbucks",
              "transactionCategory": "coffeeShop",
              "transactionAmount": "50.99",
              "transactionId": "0000004",
              "debit": true,
              "payTo": "Merchant4",
              "timestamp": 1618275504
            },
            {
              "transactionTitle": "Paycheck",
              "transactionCategory": "income",
              "transactionAmount": "200.23",
              "transactionId": "0000005",
              "debit": false,
              "payTo": "Merchant5",
              "timestamp": 1618275504
            },
            {
              "transactionTitle": "Gas Station",
              "transactionCategory": "gas",
              "transactionAmount": "200.23",
              "transactionId": "0000006",
              "debit": true,
              "payTo": "Merchant6",
              "timestamp": 1618275504
            },
            {
              "transactionTitle": "The Gap",
              "transactionCategory": "shopping",
              "transactionAmount": "400.23",
              "transactionId": "0000007",
              "payTo": "Merchant7",
              "debit": true,
              "timestamp": 1618363234
            },
            {
              "transactionTitle": "Princeton Tuition",
              "transactionCategory": "tuition",
              "transactionAmount": "300.00",
              "transactionId": "0000008",
              "payTo": "Merchant8",
              "debit": true,
              "timestamp": 1618363234
            },
            {
              "transactionTitle": "Bus",
              "transactionCategory": "transportation",
              "transactionAmount": "435.67",
              "transactionId": "0000009",
              "payTo": "Merchant9",
              "debit": true,
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Tennis Class",
              "transactionCategory": "miscellaneous",
              "transactionAmount": "90.67",
              "transactionId": "00000010",
              "payTo": "Merchant10",
              "debit": true,
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Barber Shop",
              "transactionCategory": "haircut",
              "transactionAmount": "50.67",
              "transactionId": "00000011",
              "payTo": "Merchant11",
              "debit": true,
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Internet Bill",
              "transactionCategory": "utilities",
              "transactionAmount": "100.00",
              "transactionId": "00000012",
              "payTo": "Merchant12",
              "debit": true,
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Dry Cleaning",
              "transactionCategory": "service",
              "transactionAmount": "120.00",
              "transactionId": "00000013",
              "payTo": "Merchant13",
              "debit": true,
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Rent",
              "transactionCategory": "rent",
              "transactionAmount": "1200.00",
              "transactionId": "00000014",
              "debit": true,
              "payTo": "Merchant14",
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Transfer Money",
              "transactionCategory": "transfer",
              "transactionAmount": "200.00",
              "transactionId": "00000015",
              "payTo": "Merchant15",
              "debit": true,
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Veterans Donation",
              "transactionCategory": "charity",
              "transactionAmount": "300.00",
              "transactionId": "00000016",
              "debit": true,
              "payTo": "Merchant16",
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Physical Exam",
              "transactionCategory": "health",
              "transactionAmount": "200.00",
              "transactionId": "00000017",
              "payTo": "Merchant17",
              "debit": true,
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "ATM Withdrawal",
              "transactionCategory": "withdrawals",
              "transactionAmount": "140.00",
              "transactionId": "00000018",
              "payTo": "Merchant18",
              "debit": true,
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Streaming Subscription",
              "transactionCategory": "subscriptions",
              "transactionAmount": "30.00",
              "transactionId": "00000019",
              "payTo": "Merchant19",
              "debit": true,
              "timestamp": 1618449634
            },
            {
              "transactionTitle": "Organic Groceries",
              "transactionCategory": "groceries",
              "transactionAmount": "30.00",
              "transactionId": "00000020",
              "payTo": "Merchant20",
              "debit": true,
              "timestamp": 1618449634
            }
          ]
        }));
  });
}
