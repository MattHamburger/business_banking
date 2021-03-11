import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../bloc/investment_bloc.dart';
import 'investment_presenter.dart';

class InvestmentFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvestmentBloc>(
      create: (_) => InvestmentBloc(),
      child: InvestmentPresenter(),
    );
  }
}
