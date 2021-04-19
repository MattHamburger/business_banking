import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/ui/transaction_chart/transaction_chart_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransactionChartWidget extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionBloc>(
      create: (_) => TransactionBloc(),
      child: TransactionChartPresenter(),
    );
  }
}
