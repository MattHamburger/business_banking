import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StocksDetailsAction {

  final StocksBloc bloc;
  final StocksViewModel viewModel;

  StocksDetailsAction(this.bloc, this.viewModel);

  void navigateBack(BuildContext context) async {
    CFRouterScope.of(context).popUntil(BusinessBankingRouter.hubRoute);
  }
}