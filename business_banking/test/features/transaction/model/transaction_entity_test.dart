import 'package:business_banking/features/transaction/model/transaction_entity.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TransactionEntity properties', () {
    final entity = TransactionEntity(transactionDetails: [
      TransactionModel(
          debit: true,
          transactionAmount: 9.99,
          transactionTitle: 'Boots',
          transactionId: '0000000',
          transactionCategory: 'shopping',
          payTo: "Merchant0",
          date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000))
    ]);
    expect(entity.transactionDetails.first.transactionTitle, "Boots");
    expect(entity.transactionDetails.first.transactionId, "0000000");
    expect(entity.transactionDetails.first.transactionCategory, "shopping");
    expect(entity.transactionDetails.first.payTo, "Merchant0");
    expect(entity.transactionDetails.first.date,
        DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000));

    expect(
      entity.toString(),
      'TransactionEntity([], [TransactionModel(Boots, shopping, 9.99, 0000000, Merchant0, 2021-04-12 10:29:16.000, true)])',
    );
  });

  test('CustomerEntity merge with errors = null', () {
    final entity = TransactionEntity(transactionDetails: [
      TransactionModel(
          debit: true,
          transactionAmount: 9.99,
          transactionTitle: 'Boots',
          transactionId: '0000000',
          transactionCategory: 'shopping',
          payTo: "Merchant0",
          date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000))
    ]);
    entity.merge(errors: null);
    expect(entity.transactionDetails.first.transactionTitle, "Boots");
    expect(entity.transactionDetails.first.transactionId, "0000000");
    expect(entity.transactionDetails.first.transactionCategory, "shopping");
    expect(entity.transactionDetails.first.payTo, "Merchant0");
    expect(entity.transactionDetails.first.date,
        DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000));
  });
}
