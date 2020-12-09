import 'package:business_banking/features/bill_pay/bloc/bill_pay_info_bloc.dart';
import 'package:business_banking/features/bill_pay/ui/bill_pay_info_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BillPayInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<BillPayInfoBloc>(
      create: (_) => BillPayInfoBloc(),
      child: BillPayInfoPresenter(),
    );
  }
}