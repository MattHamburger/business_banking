import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/features/stocks/ui/stocks/stocks_actions.dart';
import 'package:business_banking/features/stocks/ui/stocks/stocks_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StocksPresenter
    extends Presenter<StocksBloc, StocksViewModel, StocksScreen> {
  @override
  Stream<StocksViewModel> getViewModelStream(StocksBloc bloc) {
    return bloc.stocksViewModelPipe.receive;
  }

  @override
  StocksScreen buildScreen(BuildContext context, StocksBloc bloc,
      StocksViewModel viewModel) {
    return StocksScreen(
      viewModel: viewModel,
      actions: StocksActions(bloc),
    );
  }
}