import 'package:business_banking/features/cashback/bloc/cashback_bloc.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:business_banking/features/cashback/ui/cashback_form/cashback_form_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class CashbackFormPresenter
    extends Presenter<CashbackBloc, CashbackFormViewModel, CashbackFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Text("Hello World");
  }

  @override
  CashbackFormScreen buildScreen(BuildContext context, CashbackBloc bloc,
      CashbackFormViewModel viewModel) {
    return CashbackFormScreen(
      doInit: false,
      viewModel: viewModel);
  }

  @override
  Stream<CashbackFormViewModel> getViewModelStream(CashbackBloc bloc) {
    return bloc.cashbackFormViewModelPipe.receive;
  }
}
