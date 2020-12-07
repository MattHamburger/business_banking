import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import '../../bloc/mortgage_bloc.dart';
import 'mortgage_presenter.dart';

class MortgageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MortgageBloc>(
      create: (_) => MortgageBloc(),
      child: MortgagePresenter(),
    );
  }
}
