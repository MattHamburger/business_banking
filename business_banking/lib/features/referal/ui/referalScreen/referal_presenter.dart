import 'package:business_banking/features/referal/bloc/referal_bloc.dart';
import 'package:business_banking/features/referal/bloc/referal_event.dart';
import 'package:business_banking/features/referal/model/referal_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'referal_screen.dart';

class ReferalPresenter
    extends Presenter<referalBloc, ReferalViewModel, ReferalScreen> {
  @override
  ReferalScreen buildScreen(
      BuildContext context, referalBloc bloc, ReferalViewModel viewModel) {
    return ReferalScreen(
      viewModel: viewModel,
      onEmailChanged: (newValue) => onEmailValueChanged(bloc, newValue),
      onAddAmount: (context) => onAddAmount(bloc, context),
    );
  }

  void onNameFieldChange(referalBloc bloc, String newValue) {
    bloc.onEmailChangePipe.send(newValue);
  }

  @override
  Stream<ReferalViewModel> getViewModelStream(referalBloc bloc) {
    // TODO: implement getViewModelStream
    return bloc.referalViewModelPipe.receive;
  }

  onAddAmount(referalBloc bloc, BuildContext context) {
    bloc.onContactReferalEventPipe.send(ReferalButtonEvent(context));
  }

  void onEmailValueChanged(referalBloc bloc, String email) {
    bloc.onEmailChangePipe.send(email);
  }
}
