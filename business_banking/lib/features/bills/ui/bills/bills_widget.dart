import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:business_banking/features/bills/bloc/bills_bloc.dart';
import 'bills_presenter.dart';

class BillsWidget extends StatelessWidget {
  final bool debugEnabled = false;
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BillsBloc(),
      child: BillsPresenter()
    );
  }
}