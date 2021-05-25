import 'package:business_banking/features/advertisement/bloc/ad_bloc.dart';
import 'package:business_banking/features/advertisement/ui/ad_hub_card_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

class AdHubCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdBloc>(
      create: (_) => AdBloc(),
      child: AdHubCardPresenter(),
    );
  }
}
