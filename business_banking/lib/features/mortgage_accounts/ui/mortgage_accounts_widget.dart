import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'mortgage_accounts_presenter.dart';

class MortgageAccountsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MortgageAccountsBloc>(
      create: (_) => MortgageAccountsBloc(),
      child: MortgageAccountsPresenter(),
    );
  }
}
