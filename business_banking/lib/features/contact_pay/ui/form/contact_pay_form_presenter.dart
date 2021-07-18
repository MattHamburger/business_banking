import 'package:business_banking/features/contact_pay/bloc/contact_pay_bloc.dart';
import 'package:business_banking/features/contact_pay/bloc/contact_pay_event.dart';
import 'package:business_banking/features/contact_pay/model/form/contact_pay_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_pay_form_screen.dart';

class ContactPayFormPresenter extends Presenter<ContactPayBloc,
    ContactPayFormViewModel, ContactPayFormScreen> {
  @override
  ContactPayFormScreen buildScreen(BuildContext context, ContactPayBloc bloc,
      ContactPayFormViewModel viewModel) {
    return ContactPayFormScreen(
        viewModel: viewModel,
        //onCityFieldChange: (newValue) => onCityFieldChange(bloc, newValue));
        onPayAmountChanged: (newValue) =>
            onPayAmountValueChanged(bloc, newValue),
        onContactEmailChanged: (newValue) =>
            onContactEmailValueChanged(bloc, newValue),
        onSendMoneyButtonPressed: (context) =>
            onEventSendButtonClicked(bloc, context));
  }

  @override
  Stream<ContactPayFormViewModel> getViewModelStream(ContactPayBloc bloc) {
    return bloc.contactPayFormViewModelPipe.receive;
  }

  void onPayAmountValueChanged(ContactPayBloc bloc, String newPayValue) {
    double? realAmount = double.tryParse(newPayValue);

    if (newPayValue.isNotEmpty && (realAmount != null && realAmount > 0)) {
      bloc.onPayAmountChangedPipe.send(realAmount);
    }
  }

  void onContactEmailValueChanged(
      ContactPayBloc bloc, String newContactEmailValue) {
    if (newContactEmailValue.isNotEmpty) {
      bloc.onContactEmailChangedPipe.send(newContactEmailValue);
    }
  }

  void onEventSendButtonClicked(ContactPayBloc bloc, BuildContext context) {
    bloc.onContactPayFormEventPipe.send(PressSendMoneyButtonEvent(context));
  }
}
