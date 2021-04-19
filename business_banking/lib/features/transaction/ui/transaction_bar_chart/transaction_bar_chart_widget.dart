import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/ui/transaction_bar_chart/transaction_bar_chart_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransactionBarChartWidget extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionBloc>(
      create: (_) => TransactionBloc(),
      child: TransactionBarChartPresenter(),
    );
  }
}
