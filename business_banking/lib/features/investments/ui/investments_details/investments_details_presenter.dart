import 'package:business_banking/features/investments/bloc/investments_bloc.dart';
import 'package:business_banking/features/investments/model/investments_details/investments_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'investments_details_screen.dart';

class InvestmentsDetailsPresenter extends Presenter<InvestmentsBloc,
    InvestmentsDetailsViewModel, InvestmentsDetailsScreen> {
  @override
  Stream<InvestmentsDetailsViewModel> getViewModelStream(InvestmentsBloc bloc) {
    return bloc.investmentsDetailsViewModelPipe.receive;
  }

  @override
  InvestmentsDetailsScreen buildScreen(BuildContext context,
      InvestmentsBloc bloc, InvestmentsDetailsViewModel viewModel) {
    return InvestmentsDetailsScreen(
      viewModel: viewModel,
      presenterAction: InvestmentsDetailsPresenterActions(
        bloc,
      ),
      onStockTextChanged: (String val) {
        _onStockTextChanged(bloc, val.toUpperCase());
      },
      onSubmit: () {
        _onSubmit(bloc);
      },
    );
  }

  _onStockTextChanged(InvestmentsBloc investmentsBloc, String symbol) {
    investmentsBloc.symbolPipe.send(symbol);
  }

  _onSubmit(InvestmentsBloc investmentsBloc) {
    investmentsBloc.submitPipe.launch();
  }
}

class InvestmentsDetailsPresenterActions {
  InvestmentsBloc bloc;

  InvestmentsDetailsPresenterActions(this.bloc);

  popNavigationListener(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
