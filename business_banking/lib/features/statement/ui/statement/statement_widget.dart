import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'statement_presenter.dart';

class StatementWidget extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatementBloc>(
      create: (_) => StatementBloc(),
      child: StatementPresenter(),
    );
  }
}
