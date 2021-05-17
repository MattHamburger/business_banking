import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import 'hotels_main_screen.dart';
import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';
import 'package:business_banking/features/hotels/ui/hotels_actions.dart';
import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';

class HotelsMainPresenter
    extends Presenter<HotelsBloc, HotelsListViewModel, HotelsMainScreen> {
  @override
  Stream<HotelsListViewModel> getViewModelStream(HotelsBloc bloc) {
    return bloc.hotelsViewModelPipe.receive;
  }

  @override
  HotelsMainScreen buildScreen(BuildContext context, HotelsBloc bloc,
      HotelsListViewModel listViewModel) {
    //
    final hotelsActions = HotelsActions(bloc: bloc);
    return HotelsMainScreen(
      viewModel: listViewModel,
      actions: hotelsActions,
    );
  }
}
