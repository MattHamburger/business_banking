import 'package:business_banking/features/bills/bloc/bills_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'bill_list_presenter.dart';

class BillListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillsBloc> (
      create: (_) => BillsBloc(),
      child: BillListPresenter()
    );
  }
}