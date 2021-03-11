// package
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
// internal
import '../bloc/investment_detail_bloc.dart';
import 'investment_detail_presenter.dart';

class InvestmentDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvestmentDetailBloc>(
      create: (_) => InvestmentDetailBloc(),
      child: InvestmentDetailPresenter(),
    );
  }
}
