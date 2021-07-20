import 'package:business_banking/features/investments/bloc/investments_bloc.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class InvestmentsFeatureActions {
  InvestmentsBloc bloc;

  InvestmentsFeatureActions({required this.bloc});

  void navigateToInvestments(BuildContext context) {
    CFRouterScope.of(context)
        .push(BusinessBankingRouter.investmentBankingRoute);
  }
}
