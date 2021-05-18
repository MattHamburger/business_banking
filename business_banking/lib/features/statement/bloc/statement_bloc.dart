import 'dart:io';

import 'package:business_banking/features/statement/bloc/statement/statement_event.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_view_model.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

import 'hub_cards/statement_cards_use_case.dart';
import 'statement/statement_usecase.dart';

class StatementBloc extends Bloc {
  StatementUseCase? _statementUseCase;
  final statementViewModelPipe = Pipe<StatementViewModel>();

  StatementCardUseCase? _statementCardUseCase;
  final statementCardViewModelPipe = Pipe<StatementCardViewModel>();

  final statementEventPipe = Pipe<StatementEvent>(canSendDuplicateData: true);

  @override
  void dispose() {
    statementViewModelPipe.dispose();
    statementCardViewModelPipe.dispose();
    statementEventPipe.dispose();
  }

  StatementBloc({
    StatementUseCase? statementUseCase,
    StatementCardUseCase? statementCardUseCase,
  }) {
    _statementUseCase = statementUseCase ??
        StatementUseCase((viewModel) =>
            statementViewModelPipe.send(viewModel as StatementViewModel));
    statementViewModelPipe.whenListenedDo(_statementUseCase!.create);

    _statementCardUseCase = statementCardUseCase ??
        StatementCardUseCase(
            (viewModel) => statementCardViewModelPipe.send(viewModel));
    statementCardViewModelPipe.whenListenedDo(_statementCardUseCase!.create);

    statementEventPipe.receive.listen(statementEventPipeHandler);
  }

  void statementEventPipeHandler(StatementEvent event) {
    if (event is SendStatementToEmail) {
      _statementUseCase!.sendStatementAsPdf(event.statement, [event.recipient]);
    }
  }
}
