import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import 'hotels_hub_screen.dart';
import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';
import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';
import 'package:business_banking/features/hotels/ui/hotels_actions.dart';

class HotelsHubPresenter
    extends Presenter<HotelsBloc, HotelsListViewModel, HotelsHubScreen> {
  //
  @override
  Stream<HotelsListViewModel> getViewModelStream(HotelsBloc bloc) {
    return bloc.hotelsViewModelPipe.receive;
  }

  @override
  HotelsHubScreen buildScreen(
      BuildContext context, HotelsBloc bloc, HotelsListViewModel viewModel) {
    //
    final hotelsActions = HotelsActions(bloc: bloc);
    return HotelsHubScreen(viewModel: viewModel, actions: hotelsActions);
  }
}
