import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';
import 'hotels_hub_presenter.dart';

class HotelsHubWidget extends StatelessWidget {
  //
  @override
  Widget build(BuildContext build) {
    return BlocProvider<HotelsBloc>(
      create: (_) => HotelsBloc(),
      child: HotelsHubPresenter(),
    );
  }
}
