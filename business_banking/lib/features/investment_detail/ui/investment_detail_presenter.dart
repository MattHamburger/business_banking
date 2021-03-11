// dart
import 'dart:async';
// package
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
// internal
import '../bloc/investment_detail_bloc.dart';
import '../model/investment_detail_view_model.dart';
import 'investment_detail_screen.dart';

class InvestmentDetailPresenter extends Presenter<InvestmentDetailBloc,
    InvestmentDetailViewModel, InvestmentDetailScreen> {
  @override
  Stream<InvestmentDetailViewModel> getViewModelStream(
      InvestmentDetailBloc bloc) {
    return bloc.investmentDetailViewModelPipe.receive;
  }

  @override
  InvestmentDetailScreen buildScreen(BuildContext context,
      InvestmentDetailBloc bloc, InvestmentDetailViewModel viewModel) {
    return InvestmentDetailScreen(
      viewModel: viewModel,
      navigateToAccountDetail: () {
        _navigateToAccountDetail(context);
      },
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  void _navigateToAccountDetail(BuildContext context) {
    CFRouterScope.of(context).pop();
  }
}
