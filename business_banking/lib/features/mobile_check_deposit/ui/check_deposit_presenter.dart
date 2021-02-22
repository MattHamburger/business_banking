import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_bloc.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_view_model.dart';
import 'package:business_banking/features/mobile_check_deposit/ui/confirmation/check_deposit_confirmation_widget.dart';
import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'check_deposit_screen_widgets/check_deposit_screen.dart';

class CheckDepositPresenter extends Presenter<CheckDepositBloc,
    CheckDepositViewModel, CheckDepositScreen> {

  @override
  CheckDepositScreen buildScreen(BuildContext context, CheckDepositBloc bloc,
      CheckDepositViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (viewModel.serviceStatus == ServiceStatus.success && viewModel.dataStatus == DataStatus.valid) {
        _navigateToConfirmationScreen(context);
      }
      else if (viewModel.serviceStatus == ServiceStatus.fail) {
        _showErrorDialog(context, bloc);
      }
    });

    return CheckDepositScreen(
        viewModel: viewModel,
        onChangeSelectedToAccount: (selectedToAccount) {
          _onChangeSelectedToAccount(bloc, selectedToAccount);
        },
        onChangeAmount: (amount) {
          _onChangeAmount(bloc, amount);
        },
        onChangeDate: (date) {
          _onChangeDate(bloc, date);
        },
        checkFrontImage: (checkFrontImage) {
          _checkFrontImage(bloc, checkFrontImage);
        },
        checkBackImage: (checkBackImage) {
          _checkBackImage(bloc, checkBackImage);
        },
        onTapSubmit:
        () { _onTapSubmit(context, bloc, viewModel); }

    );
  }

  @override
  Stream<CheckDepositViewModel> getViewModelStream(CheckDepositBloc bloc) {
    return bloc.checkDepositViewModelPipe.receive;
  }



  void _onChangeSelectedToAccount(CheckDepositBloc bloc, String selectedToAccount) {
    bloc.toAccountPipe.send(selectedToAccount);
  }

  void _onChangeAmount(CheckDepositBloc bloc, String amountString) {
    double amount = double.tryParse(amountString);
    if (amountString == '' || (amount != null && amount > 0)) {
      bloc.amountPipe.send(amountString);
    }
  }

  void _onChangeDate(CheckDepositBloc bloc, DateTime date) {
    bloc.datePipe.send(date);
  }

  void _checkFrontImage(CheckDepositBloc bloc, String checkFrontBase64) {
    if (checkFrontBase64 == '' || (checkFrontBase64 != null)) {
      bloc.checkFrontImage.send(checkFrontBase64);
    }
  }

  void _checkBackImage(CheckDepositBloc bloc, String checkBackBase64) {
    if (checkBackBase64 == '' || (checkBackBase64 != null)) {
      bloc.checkBackImage.send(checkBackBase64);
    }
  }

  void _onTapSubmit(BuildContext context, CheckDepositBloc bloc, CheckDepositViewModel viewModel) {
    if (viewModel.dataStatus == DataStatus.valid) {
      bloc.submitPipe.launch();
    }
    else {
      _showInvalidDataDialog(context);
    }
  }

  void _navigateToConfirmationScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          settings: RouteSettings(name: 'CheckDepositConfirmationScreen'),
          builder: (context) => CheckDepositConfirmationWidget()
      )
    );
  }

  void _showErrorDialog(BuildContext context, CheckDepositBloc bloc) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text('Submit Failed'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              bloc.resetServiceStatusPipe.launch();
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  void _showInvalidDataDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Invalid'),
        content: Text('Please fill all transfer fields.'),
        actions: <Widget>[
          FlatButton(
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