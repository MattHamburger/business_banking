import 'package:business_banking/features/billpay/api/billpay_service.dart';
import 'package:business_banking/features/billpay/bloc/billpay_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'billpay_presenter.dart';

class BillPayFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillPayBloc>(
      create: (_) => BillPayBloc(billPayService: BillPayService()),
      child: BillPayPresenter(),
    );
  }
}
