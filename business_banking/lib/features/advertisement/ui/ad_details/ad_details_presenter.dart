import 'package:business_banking/features/advertisement/bloc/ad_bloc.dart';
import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:business_banking/features/advertisement/ui/ad_details/ad_details_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class AdDetailsPresenter
    extends Presenter<AdBloc, AdHubCardViewModel, AdDetailsScreen> {
  @override
  AdDetailsScreen buildScreen(
      BuildContext context, AdBloc bloc, AdHubCardViewModel viewModel) {
    return AdDetailsScreen(viewModel: viewModel);
  }

  @override
  Stream<AdHubCardViewModel> getViewModelStream(AdBloc bloc) {
    return bloc.adHubCardViewModelPipe.receive;
  }
}
