import 'package:business_banking/features/bank_locator/bloc/bank_locator_bloc.dart';
import 'package:business_banking/features/bank_locator/ui/bank_locator_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BankLocatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BankLocatorBloc>(
      create: (_) => BankLocatorBloc(),
      child: BankLocatorPresenter(),
    );
  }
}
