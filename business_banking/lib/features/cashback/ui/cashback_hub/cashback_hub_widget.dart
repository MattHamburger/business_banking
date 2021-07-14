import 'package:business_banking/features/cashback/bloc/cashback_hub/cashback_hub_bloc.dart';
import 'package:business_banking/features/cashback/ui/cashback_hub/cashback_hub_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

// make this tapabble and navigate to the Feature Widget
class CashbackHubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CashbackHubBloc>(
      create: (_) => CashbackHubBloc(),
      child: CashbackHubPresenter(),
    );
  }
}
