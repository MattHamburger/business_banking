import 'dart:async';
import 'package:business_banking/features/bill_pay/bloc/bill_pay_info_bloc.dart';
import 'package:business_banking/features/bill_pay/model/view_models/bill_pay_info_view_model.dart';
import 'package:business_banking/features/bill_pay/ui/bill_pay_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/scheduler.dart';

// import 'customer_screen.dart';
// import 'customer_detail_widget.dart';

class BillPayInfoPresenter extends Presenter<BillPayInfoBloc,
    BillPayInfoViewModel, BillPayInfoScreen> {
  @override
  Stream<BillPayInfoViewModel> getViewModelStream(BillPayInfoBloc bloc) {
    return bloc.billPayInfoViewModelPipe.receive;
  }

  @override
  BillPayInfoScreen buildScreen(BuildContext context, BillPayInfoBloc bloc,
      BillPayInfoViewModel viewModel) {
    return BillPayInfoScreen(
      viewModel,
    );
  }

}
