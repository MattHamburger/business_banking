import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/features/stocks/ui/stocks_details/stocks_details_actions.dart';
import 'package:business_banking/features/stocks/ui/stocks_details/stocks_details_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StocksDetailsPresenter extends Presenter<StocksBloc, StocksViewModel, StocksDetailsScreen> {
  @override
  Stream<StocksViewModel> getViewModelStream(StocksBloc bloc) {
    return bloc.stocksViewModelPipe.receive;
  }

  @override
  StocksDetailsScreen buildScreen(BuildContext context, StocksBloc bloc, StocksViewModel viewModel) {
    return StocksDetailsScreen(
      viewModel: viewModel,
      actions: StocksDetailsAction(bloc, viewModel),
    );
  }

}