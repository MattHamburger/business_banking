import 'package:business_banking/features/contact_pay/bloc/contact_pay_bloc.dart';
import 'package:business_banking/features/contact_pay/model/contact_pay_form_view_model.dart';
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
        onCityFieldChange: (newValue) => onCityFieldChange(bloc, newValue));
  }

  @override
  Stream<ContactPayFormViewModel> getViewModelStream(ContactPayBloc bloc) {
    return bloc.contactPayFormViewModelPipe.receive;
  }

  void onCityFieldChange(ContactPayBloc bloc, String newValue) {
    bloc.onCityChangePipe.send(newValue);
  }
}
