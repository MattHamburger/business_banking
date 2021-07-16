import 'package:business_banking/features/fixed_deposit/bloc/fixed_deposit_bloc.dart';
import 'package:business_banking/features/fixed_deposit/ui/fixed_deposit_options/fixed_deposit_options_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class FixedDepositOptionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FixedDepositBloc>(
      create: (_) => FixedDepositBloc(),
      child: FixedDepositOptionsPresenter(),
    );
  }
}
