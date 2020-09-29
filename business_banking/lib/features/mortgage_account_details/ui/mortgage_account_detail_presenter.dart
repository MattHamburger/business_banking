import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_view_model.dart';
import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_bloc.dart';
import 'mortgage_account_detail_screen.dart';

class MortgageAccountDetailPresenter extends Presenter<MortgageAccountDetailBloc,
    MortgageAccountDetailViewModel, MortgageAccountDetailScreen> {
  @override
  Stream<MortgageAccountDetailViewModel> getViewModelStream(MortgageAccountDetailBloc bloc) {
    return bloc.mortgageAccountDetailViewModelPipe.receive;
  }

  @override
  MortgageAccountDetailScreen buildScreen(BuildContext context, MortgageAccountDetailBloc bloc,
      MortgageAccountDetailViewModel viewModel) {
    return MortgageAccountDetailScreen(
      viewModel: viewModel,
      navigateToMortgageAccounts: () {
        _navigateToMortgageAccounts(context);
      },
    );
  }

  void _navigateToMortgageAccounts(BuildContext context) {
    Navigator.pop(context);
  }
}
