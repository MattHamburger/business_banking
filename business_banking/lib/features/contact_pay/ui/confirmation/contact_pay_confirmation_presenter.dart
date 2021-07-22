import 'package:business_banking/features/contact_pay/bloc/contact_pay_bloc.dart';
import 'package:business_banking/features/contact_pay/bloc/contact_pay_event.dart';
import 'package:business_banking/features/contact_pay/model/confirmation/contact_pay_confirmation_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_pay_confirmation_screen.dart';

class ContactPayConfirmationPresenter extends Presenter<ContactPayBloc,
    ContactPayConfirmationViewModel, ContactPayConfirmationScreen> {
  // Mock the Bloc for presenter testing - it is the only thing that
  // the presenter has no internal control over
  @override
  ContactPayConfirmationScreen buildScreen(BuildContext context,
      ContactPayBloc bloc, ContactPayConfirmationViewModel viewModel) {
    return ContactPayConfirmationScreen(
      viewModel: viewModel,
      onOKButtonPressed: (context) => onEventOKButtonPressed(bloc, context),
    );
  }

  @override
  Stream<ContactPayConfirmationViewModel> getViewModelStream(
      ContactPayBloc bloc) {
    return bloc.contactPayConfirmationViewModelPipe.receive;
  }

  void onEventOKButtonPressed(ContactPayBloc bloc, BuildContext context) {
    bloc.onContactPayConfirmationEventPipe.send(PressOKButtonEvent(context));
  }
}
