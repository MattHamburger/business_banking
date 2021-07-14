import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CashbackFormScreen extends Screen {
  final CashbackFormViewModel viewModel;

  final ValueChanged<String> onCityFieldChange;

  CashbackFormScreen(
      {required this.viewModel, required this.onCityFieldChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: AutoSizeText(
          'CASH BACK',
          maxFontSize: 16,
          minFontSize: 10,
        ),
      ),
      body: Column(
        children: <Widget>[
          Text(viewModel.city),
          (TextField(
            onChanged: onCityFieldChange,
          ))
        ],
      ),
    );
  }
}
