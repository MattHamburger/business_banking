import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';

class PromoHubCardPresenter
    extends Presenter<PromoBloc, PromoHubCardViewModel, PromoHubCardScreen> {

  @override
  Stream<PromoHubCardViewModel> getViewModelStream(PromoBloc bloc) {
    return bloc.promoHubCardViewModelPipe.receive;
  }

  @override
  PromoHubCardScreen buildScreen(
      BuildContext context, PromoBloc bloc, PromoHubCardViewModel viewModel) {
    return PromoHubCardScreen(
        viewModel: viewModel, actions: PromoHubCardPresenterActions()
    );
  }
}

class PromoHubCardPresenterActions {
  PromoHubCardPresenterActions();

  void navigateToCreditCardDetails(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.promoCatalogRoute);
  }
}
