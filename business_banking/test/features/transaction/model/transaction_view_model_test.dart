import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TransactionViewModel initialize', () {
    final viewModel = TransactionViewModel(transactionDetails: [
      TransactionModel(
          debit: true,
          transactionAmount: 9.99,
          transactionTitle: 'Boots',
          transactionId: '0000000',
          transactionCategory: 'shopping',
          payTo: "Merchant0",
          date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000))
    ]);

    expect(viewModel.props, [viewModel.transactionDetails]);
  });
  test('CustomerViewModel initialize with error', () {
    try {
      TransactionViewModel(transactionDetails: null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
