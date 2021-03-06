import 'package:business_banking/features/deposit_check/bloc/deposit_check_bloc.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import 'deposit_check_presenter.dart';

class DepositCheckWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DepositCheckBloc>(
      create: (_) => DepositCheckBloc(),
      child: DepositCheckPresenter(),
    );
  }
}
