import 'package:business_banking/features/transaction/api/transaction_service_response_model_list.dart';
import 'package:business_banking/features/transaction/bloc/transaction_service_adapter.dart';
import 'package:business_banking/features/transaction/model/transaction_entity.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = TransactionServiceAdapter().createEntity(
        TransactionEntity(),
        TransactionServiceResponseModelList.fromJson({
          "accountTransactions": [
            {
              "transactionTitle": "Boots",
              "transactionCategory": "shopping",
              "transactionAmount": "9.99",
              "transactionId": "0000000"
            },
          ]
        }));

    expect(
        entity,
        TransactionEntity(transactionDetails: [
          TransactionModel(
            transactionAmount: '9.99',
            transactionTitle: 'Boots',
            transactionId: '0000000',
            transactionCategory: 'shopping',
          )
        ]));
  });
}