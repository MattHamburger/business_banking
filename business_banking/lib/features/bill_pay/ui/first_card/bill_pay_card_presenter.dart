import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../bloc/bill_pay_bloc.dart';
import '../../../../routes.dart';
import 'bill_pay_card_screen.dart';

class BillPayCardPresenter extends Presenter<BillPayBloc,
    BillPayCardViewModel, BillPayCardScreen> {
  @override
  Stream<BillPayCardViewModel> getViewModelStream(BillPayBloc bloc) {
    return bloc.billPayCardViewModelPipe.receive;
  }

  @override
  BillPayCardScreen buildScreen(BuildContext context,
      BillPayBloc bloc, BillPayCardViewModel viewModel) {
    return BillPayCardScreen(
      viewModel: viewModel,
      presenterActions: BillPayCardPresenterActions(bloc, viewModel),
    );
  }
}

class BillPayCardPresenterActions {
  BillPayBloc bloc;
  BillPayCardViewModel viewModel;

  BillPayCardPresenterActions(this.bloc, this.viewModel);

  navigateToBillPay(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.billPayRoute);
  }
}
