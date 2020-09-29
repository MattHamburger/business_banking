import 'dart:async';

import 'package:business_banking/features/mortgage_account_details/ui/mortgage_account_detail_widget.dart';
import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_bloc.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mortgage_accounts_screen.dart';

class MortgageAccountsPresenter extends Presenter<MortgageAccountsBloc, MortgageAccountsViewModel, MortgageAccountsScreen> {
  @override
  Stream<MortgageAccountsViewModel> getViewModelStream(MortgageAccountsBloc bloc) {
    return bloc.mortgageAccountsViewModelPipe.receive;
  }

  @override
  MortgageAccountsScreen buildScreen(BuildContext context, MortgageAccountsBloc bloc, MortgageAccountsViewModel viewModel) {
    return MortgageAccountsScreen(
      viewModel: viewModel,
      navigateToAccountDetail: () {
        _navigateToAccountDetail(context);
      },
    );
  }

  void _navigateToAccountDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: 'MortgageAccountDetailWidget'),
        builder: (context) => MortgageAccountDetailWidget(),
      ),
    );
  }
}
