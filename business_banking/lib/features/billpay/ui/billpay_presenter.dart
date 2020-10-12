import 'dart:async';

import 'package:business_banking/features/billpay/bloc/billpay_bloc.dart';
import 'package:business_banking/features/billpay/model/billpay_view_model.dart';
import 'package:business_banking/features/billpay/ui/billpay_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BillPayPresenter
    extends Presenter<BillPayBloc, BillPayViewModel, BillPayScreen> {
  @override
  Stream<BillPayViewModel> getViewModelStream(BillPayBloc bloc) {
    return bloc.billPayViewModelPipe.receive;
  }

  @override
  BillPayScreen buildScreen(
      BuildContext context, BillPayBloc bloc, BillPayViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == ServiceStatus.success) {
        _showPaySuccessMessage(context);
        return;
      } else if (viewModel.serviceStatus == ServiceStatus.fail) {
      } else if (viewModel.serviceStatus == ServiceStatus.unknown) {}
      if (viewModel.dataStatus == DataStatus.invalid) {
        _showErrorMessage(context);
      }
    });
    return BillPayScreen(
      viewModel: viewModel,
      startPayTap: () {
        bloc.submitPipe.send(viewModel);
      },
      onChangeBillPayAmount: (amount) {
        bloc.billAmontPipe.send(double.parse(amount));
      },
    );
  }

  void _showErrorMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        key: Key('BillPaySuccessAlert'),
        title: Text('Error'),
        content: Text('Please Enter amount'),
        actions: <Widget>[
          FlatButton(
            key: Key('BtnOK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  void _showPaySuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        key: Key('BillPayEmptyAmountAlert'),
        title: Text('Success'),
        content: Text('Pay Successful'),
        actions: <Widget>[
          FlatButton(
            key: Key('BtnOK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
