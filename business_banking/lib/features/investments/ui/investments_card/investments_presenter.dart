import 'package:business_banking/features/investments/bloc/investments_bloc.dart';
import 'package:business_banking/features/investments/model/investments_view_model.dart';
import 'package:business_banking/features/investments/ui/investments_card/investments_feature_actions.dart';
import 'package:business_banking/features/investments/ui/investments_card/investments_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class InvestmentPresenter extends Presenter<InvestmentsBloc,
    InvestmentsViewModel, InvestmentsScreen> {
  @override
  InvestmentsScreen buildScreen(BuildContext context, InvestmentsBloc bloc,
      InvestmentsViewModel viewModel) {
    final myActions = InvestmentsFeatureActions(bloc: bloc);

    // implement buildScreen
    return InvestmentsScreen(
      viewModel: viewModel,
      actions: myActions,
    );
  }

  @override
  Stream<InvestmentsViewModel> getViewModelStream(InvestmentsBloc bloc) {
    // implement getViewModelStream
    return bloc.investmentsViewModelPipe.receive;
  }
}
