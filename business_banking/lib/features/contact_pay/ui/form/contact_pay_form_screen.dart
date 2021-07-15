import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/contact_pay/model/contact_pay_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactPayFormScreen extends Screen {
  final ContactPayFormViewModel viewModel;

  final ValueChanged<String> onCityFieldChange;

  ContactPayFormScreen(
      {required this.viewModel, required this.onCityFieldChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: AutoSizeText(
          'SEND MONEY',
          maxFontSize: 16,
          minFontSize: 10,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Cash Back option not implemented yet.' + viewModel.city,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
            ),
          ),
          TextField(
            onChanged: (val) =>
                {onCityFieldChange(val), print("city text changed")},
          )
        ],
      ),
    );
  }
}
