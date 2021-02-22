import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_bloc.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_confirmation_view_model.dart';
import 'package:business_banking/features/mobile_check_deposit/ui/check_deposit_widget.dart';
import 'package:business_banking/features/mobile_check_deposit/ui/confirmation/check_deposit_confirmation_screen.dart';
import 'package:business_banking/features/transfer_funds/ui/loading_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CheckDepositConfirmationPresenter extends Presenter<CheckDepositBloc,
    CheckDepositConfirmationViewModel, CheckDepositConfirmationScreen> {
  @override
  Stream<CheckDepositConfirmationViewModel> getViewModelStream(
      CheckDepositBloc bloc) {
    return bloc.confirmationViewModelPipe.receive;
  }

  @override
  CheckDepositConfirmationScreen buildScreen(BuildContext context,
      CheckDepositBloc bloc, CheckDepositConfirmationViewModel viewModel) {
    return CheckDepositConfirmationScreen(
      viewModel: viewModel,
      navigateToCheckDepositScreen: () => _navigateToCheckDepositScreen(context, bloc),
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return LoadingScreen('Check Deposit Confirmation');
  }

  void _navigateToCheckDepositScreen(
      BuildContext context, CheckDepositBloc bloc) {
    bloc.resetViewModelPipe.launch();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            maintainState: false,
            settings: RouteSettings(name: 'CheckDepositScreen'),
            builder: (context) => CheckDepositWidget(), ));
  }
}
