import 'dart:async';
import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:business_banking/features/transaction/ui/transaction_chart/transaction_chart_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionChartPresenter extends Presenter<TransactionBloc,
    TransactionViewModel, TransactionChartScreen> {
  @override
  Stream<TransactionViewModel> getViewModelStream(TransactionBloc bloc) {
    return bloc.transactionDetailsViewModelPipe.receive;
  }

  @override
  TransactionChartScreen buildScreen(BuildContext context, TransactionBloc bloc,
      TransactionViewModel viewModel) {
    return TransactionChartScreen(
      viewModel: viewModel,
      navigateToHubScreen: () => _navigateToHubScreen(context),
    );
  }

  void _navigateToHubScreen(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
