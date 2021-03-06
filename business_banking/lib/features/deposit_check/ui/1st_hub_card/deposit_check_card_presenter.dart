import 'package:business_banking/features/deposit_check/bloc/1st_hub_card/deposit_check_card_event.dart';
import 'package:business_banking/features/deposit_check/model/1st_hub_card/deposit_check_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../bloc/deposit_check_bloc.dart';
import '../../../../routes.dart';
import 'deposit_check_card_screen.dart';

class DepositCheckCardPresenter extends Presenter<DepositCheckBloc,
    DepositCheckCardViewModel, DepositCheckCardScreen> {
  @override
  Stream<DepositCheckCardViewModel> getViewModelStream(DepositCheckBloc bloc) {
    return bloc.depositCheckCardViewModelPipe.receive;
  }

  @override
  DepositCheckCardScreen buildScreen(BuildContext context,
      DepositCheckBloc bloc, DepositCheckCardViewModel viewModel) {
    return DepositCheckCardScreen(
      viewModel: viewModel,
      pressenterActions: DepositCheckCardPressenterActions(bloc, viewModel),
    );
  }
}

class DepositCheckCardPressenterActions {
  DepositCheckBloc bloc;
  DepositCheckCardViewModel viewModel;

  DepositCheckCardPressenterActions(this.bloc, this.viewModel);

  navigateToDepositCheck(BuildContext context) {
    bloc.depositCheckCardEventPipe
        .send(UpdateAccountInfoEvent(viewModel.accountInfo));
    CFRouterScope.of(context).push(BusinessBankingRouter.depositCheckRoute);
  }
}
