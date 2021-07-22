import 'package:business_banking/features/fixed_deposit/model/fixed_deposit_request_viewmodel.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class FixedDepositRequestScreen extends Screen {
  final VoidCallback _onSubmit;
  final FixedDepositRequestViewModel _viewModel;

  FixedDepositRequestScreen({onSubmit, viewModel})
      : _onSubmit = onSubmit,
        _viewModel = viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextField(
            decoration: _fixedDepositTextFormDecoration.copyWith(
              labelText: "Deposit Amount",
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 32.0,
          ),
          TextField(
            decoration: _fixedDepositTextFormDecoration.copyWith(
              labelText: "Tenure (in months)",
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 32.0,
          ),
          TextField(
            decoration: _fixedDepositTextFormDecoration.copyWith(
              labelText: "Interest Rate",
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(
            height: 32.0,
          ),
          TextField(
            decoration: _fixedDepositTextFormDecoration.copyWith(
              labelText: "Email Address",
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          TextField(
            decoration: _fixedDepositTextFormDecoration.copyWith(
              labelText: "Nominee Name (optional)",
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          TextField(
            decoration: _fixedDepositTextFormDecoration.copyWith(
              labelText: "Remarks",
            ),
          ),
          const SizedBox(
            height: 32.0,
          ),
          MaterialButton(
            onPressed: _viewModel.isBusy ? null : _onSubmit,
            child: _viewModel.isBusy
                ? CircularProgressIndicator()
                : Text("Submit"),
            textColor: Colors.white,
            disabledColor: Colors.green.withAlpha(100),
            color: Colors.green,
            minWidth: double.infinity,
            padding: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            elevation: 4.0,
          )
        ],
      ),
    );
  }
}

var _fixedDepositTextFormDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(),
  border: OutlineInputBorder(),
  focusedBorder: OutlineInputBorder(),
);
