// dart
import 'dart:async';
// package
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// internal
import '../../../routes.dart';
import '../bloc/investment_bloc.dart';
import '../model/investment_view_model.dart';
import 'investment_screen.dart';

class InvestmentPresenter
    extends Presenter<InvestmentBloc, InvestmentViewModel, InvestmentScreen> {
  @override
  Stream<InvestmentViewModel> getViewModelStream(InvestmentBloc bloc) {
    return bloc.investmentViewModelPipe.receive;
  }

  @override
  InvestmentScreen buildScreen(BuildContext context, InvestmentBloc bloc,
      InvestmentViewModel viewModel) {
    return InvestmentScreen(
      viewModel: viewModel,
      navigateToInvestmentDetail: () {
        _navigateToInvestmentDetail(context);
      },
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _navigateToInvestmentDetail(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.investmentDetailRoute);
  }
}
