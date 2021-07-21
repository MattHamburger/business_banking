import 'package:business_banking/features/referal/bloc/referal_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'referal_hub_presenter.dart';

class referalHubWidget extends StatelessWidget {
  final bool debugEnabled = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<referalBloc>(
      create: (_) => referalBloc(),
      child: referalHubPresenter(),
    );
  }
}
