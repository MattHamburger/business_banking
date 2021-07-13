import 'package:business_banking/features/cashback/bloc/cashback_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'cashback_hub_presenter.dart';

// Entry point for feature on screen
class CashbackHubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CashbackBloc>(
      create: (_) => CashbackBloc(),
      child: CashbackHubPresenter(),
    );
  }
}
