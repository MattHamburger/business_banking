import 'package:business_banking/features/referal/bloc/referal_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'referal_presenter.dart';

class ReferalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<referalBloc>(
      create: (_) => referalBloc(),
      child: ReferalPresenter(),
    );
  }
}
