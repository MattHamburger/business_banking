import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import 'statement_cards_presenter.dart';

class StatementCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatementBloc>(
      create: (_) => StatementBloc(),
      child: StatementCardPresenter(),
    );
  }
}
