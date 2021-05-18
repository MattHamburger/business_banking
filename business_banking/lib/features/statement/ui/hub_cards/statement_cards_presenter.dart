import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';
import 'statement_cards_screen.dart';

class StatementCardPresenter extends Presenter<StatementBloc,
    StatementCardViewModel, StatementCardScreen> {
  @override
  Stream<StatementCardViewModel> getViewModelStream(StatementBloc bloc) {
    return bloc.statementCardViewModelPipe.receive;
  }

  @override
  StatementCardScreen buildScreen(BuildContext context, StatementBloc bloc,
      StatementCardViewModel viewModel) {
    return StatementCardScreen(
      viewModel: viewModel,
      presenterActions: StatementCardPresenterActions(bloc, viewModel),
    );
  }
}

class StatementCardPresenterActions {
  StatementBloc bloc;
  StatementCardViewModel viewModel;

  StatementCardPresenterActions(this.bloc, this.viewModel);

  navigateBackToHub(BuildContext context) {
    CFRouterScope.of(context).pop();
  }

  navigateToViewStatement(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.viewStatements);
  }
}
