import 'package:business_banking/features/offers/bloc/offers_bloc.dart';
import 'package:business_banking/features/offers/model/offers_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

import 'offers_hub_actions.dart';
import 'offers_hub_screen.dart';

class OffersHubPresenter
    extends Presenter<OffersBloc, OffersViewModel, OffersHubScreen> {
  @override
  Stream<OffersViewModel> getViewModelStream(OffersBloc bloc) {
    return bloc.offersViewModelPipe.receive;
  }

  @override
  OffersHubScreen buildScreen(
    BuildContext context,
    OffersBloc bloc,
    OffersViewModel viewModel,
  ) {
    return OffersHubScreen(
      viewModel: viewModel,
      actions: OffersHubActions(),
    );
  }
}
