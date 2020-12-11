import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/features/budget/ui/budget_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BudgetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BudgetBloc>(
      create: (_) => BudgetBloc(),
      child: BudgetPresenter(),
    );
  }
}
