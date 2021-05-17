import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StocksActions {

  final StocksBloc bloc;

  StocksActions(this.bloc);

  void navigateToStocksDetails(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.stocksDetailsRoute);
  }

}