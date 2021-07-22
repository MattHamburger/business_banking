import 'package:business_banking/features/fixed_deposit/bloc/fixed_deposit_bloc.dart';
import 'package:business_banking/features/fixed_deposit/model/fixed_deposit_request_viewmodel.dart';
import 'package:business_banking/features/fixed_deposit/ui/fixed_deposit_card/fixed_deposit_card_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import '../../../../routes.dart';

class FixedDepositCardPresenter extends Presenter<FixedDepositBloc,
    FixedDepositRequestViewModel, FixedDepositCardScreen> {
  @override
  FixedDepositCardScreen buildScreen(BuildContext context,
      FixedDepositBloc bloc, FixedDepositRequestViewModel viewModel) {
    return FixedDepositCardScreen(
      onFixedDepositTapped: () => CFRouterScope.of(context)
          .popUntil(BusinessBankingRouter.fixedDepositScreenRoute),
    );
  }

  @override
  Stream<FixedDepositRequestViewModel> getViewModelStream(
      FixedDepositBloc bloc) {
    // TODO: implement getViewModelStream
    throw UnimplementedError();
  }
}
