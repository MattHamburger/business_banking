import 'package:business_banking/features/offers/bloc/offers_bloc.dart';
import 'package:business_banking/features/offers/model/offers_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

import 'offers_list_actions.dart';
import 'offers_list_screen.dart';

class OffersListPresenter
    extends Presenter<OffersBloc, OffersViewModel, OffersListScreen> {
  @override
  Stream<OffersViewModel> getViewModelStream(OffersBloc bloc) {
    return bloc.offersViewModelPipe.receive;
  }

  @override
  OffersListScreen buildScreen(
    BuildContext context,
    OffersBloc bloc,
    OffersViewModel viewModel,
  ) {
    return OffersListScreen(
      viewModel: viewModel,
      actions: OffersListActions(),
    );
  }
}
