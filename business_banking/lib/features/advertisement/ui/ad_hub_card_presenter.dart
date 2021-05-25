import 'package:business_banking/features/advertisement/bloc/ad_bloc.dart';
import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:business_banking/features/advertisement/ui/ad_hub_card_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class AdHubCardPresenter
    extends Presenter<AdBloc, AdHubCardViewModel, AdHubCardScreen> {
  @override
  AdHubCardScreen buildScreen(
      BuildContext context, AdBloc bloc, AdHubCardViewModel viewModel) {
    return AdHubCardScreen(
        viewModel: viewModel, actions: AdHubCardPresenterActions());
  }

  @override
  Stream<AdHubCardViewModel> getViewModelStream(AdBloc bloc) {
    return bloc.adHubCardViewModelPipe.receive;
  }
}

class AdHubCardPresenterActions {
  AdHubCardPresenterActions();

  void navigateToCreditCardDetails(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.adDetails);
  }
}
