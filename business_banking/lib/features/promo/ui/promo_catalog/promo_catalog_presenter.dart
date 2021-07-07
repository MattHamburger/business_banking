import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/ui/promo_catalog/promo_catalog_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';

class PromoCatalogPresenter
extends Presenter<PromoBloc, PromoHubCardViewModel, PromoCatalogScreen> {

  @override
  PromoCatalogScreen buildScreen(
      BuildContext context,
      PromoBloc bloc,
      PromoHubCardViewModel viewModel) {
    return PromoCatalogScreen(viewModel: viewModel);
  }

  @override
  Stream<PromoHubCardViewModel> getViewModelStream(PromoBloc bloc) {
   return bloc.promoHubCardViewModelPipe.receive;
  }
}
