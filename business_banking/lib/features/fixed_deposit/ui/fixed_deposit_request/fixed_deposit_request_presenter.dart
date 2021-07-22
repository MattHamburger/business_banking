import 'package:business_banking/features/fixed_deposit/bloc/fixed_deposit_bloc.dart';
import 'package:business_banking/features/fixed_deposit/model/fixed_deposit_request_viewmodel.dart';
import 'package:business_banking/features/fixed_deposit/ui/fixed_deposit_request/fixed_deposit_request_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class FixedDepositRequestPresenter extends Presenter<FixedDepositBloc,
    FixedDepositRequestViewModel, FixedDepositRequestScreen> {
  @override
  FixedDepositRequestScreen buildScreen(BuildContext context,
      FixedDepositBloc bloc, FixedDepositRequestViewModel viewModel) {
    print("got callbacke");
    if (!viewModel.isValidData) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter all the fields'),
        ),
      );
    }
    return FixedDepositRequestScreen(
      onSubmit: () => handleSubmit(bloc),
      viewModel: viewModel,
    );
  }

  @override
  Stream<FixedDepositRequestViewModel> getViewModelStream(
      FixedDepositBloc bloc) {
    return bloc.fixedDepositRequestViewModelPipe.receive;
  }

  void handleSubmit(FixedDepositBloc bloc) {
    bloc.onSubmit.launch();
  }
}
