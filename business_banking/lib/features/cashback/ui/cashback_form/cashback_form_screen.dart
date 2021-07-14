import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CashbackFormScreen extends Screen {
  final CashbackFormViewModel viewModel;

  CashbackFormScreen(
      {required this.viewModel, String route = 'initial', bool doInit = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[Text("Hello World"), Text(viewModel.city)],
      ),
    );
  }
}
