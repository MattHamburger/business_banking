import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'check_deposit_confirmation_presenter.dart';

class CheckDepositConfirmationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CheckDepositBloc(),
      child: CheckDepositConfirmationPresenter(),
    );
  }
}