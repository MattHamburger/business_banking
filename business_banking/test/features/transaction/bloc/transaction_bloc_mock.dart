import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class TransactionBlocMock extends Fake implements TransactionBloc {
  Pipe<TransactionViewModel> transactionDetailsViewModelPipe =
      Pipe<TransactionViewModel>();

  TransactionBlocMock() {
    transactionDetailsViewModelPipe.whenListenedDo(() {
      transactionDetailsViewModelPipe
          .send(TransactionViewModel(transactionDetails: [
        TransactionModel(
            debit: true,
            transactionAmount: 9.99,
            transactionTitle: 'Boots',
            transactionId: '0000000',
            transactionCategory: 'shopping',
            payTo: "Merchant0",
            date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000))
      ]));
    });
  }

  @override
  void dispose() {}
}
