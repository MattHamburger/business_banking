import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks/ui/stocks/stocks_presenter.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StocksBloc>(
      create: (_) => StocksBloc(),
      child: StocksPresenter(),
    );
  }
}