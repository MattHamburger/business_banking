import 'package:business_banking/features/transaction/api/transaction_service.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

import 'transaction_usecase.dart';

class TransactionBloc extends Bloc {
  TransactionUseCase _useCase;

  final transactionDetailsViewModelPipe = Pipe<TransactionViewModel>();

  @override
  void dispose() {
    transactionDetailsViewModelPipe.dispose();
  }

  TransactionBloc({TransactionService transactionDetailsService}) {
    _useCase = TransactionUseCase(
        (viewModel) => transactionDetailsViewModelPipe.send(viewModel));
    transactionDetailsViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
