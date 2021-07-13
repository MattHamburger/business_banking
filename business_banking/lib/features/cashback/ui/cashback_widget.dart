import 'package:business_banking/features/cashback/bloc/cashback_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'cashback_presenter.dart';

class CashBackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CashbackBloc>(
      create: (_) => CashbackBloc(),
      child: CashbackPresenter(),
    );
  }
}
