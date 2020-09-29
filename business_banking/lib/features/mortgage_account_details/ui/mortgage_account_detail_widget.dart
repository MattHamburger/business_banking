import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_bloc.dart';
import 'mortgage_account_detail_presenter.dart';

class MortgageAccountDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<MortgageAccountDetailBloc>(
      create: (_) => MortgageAccountDetailBloc(),
      child: MortgageAccountDetailPresenter(),
    );
  }
}
