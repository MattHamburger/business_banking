import 'package:business_banking/features/contact_pay/bloc/contact_pay_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'contact_pay_form_presenter.dart';

class ContactPayFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactPayBloc>(
      create: (_) => ContactPayBloc(),
      child: ContactPayFormPresenter(),
    );
  }
}
