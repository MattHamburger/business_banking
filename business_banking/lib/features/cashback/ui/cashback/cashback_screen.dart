import 'package:business_banking/features/cashback/model/cashback_viewmodel.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CashbackScreen extends Screen {
  final CashbackViewModel cashbackViewModel;
  final VoidCallback onCashbackRequest;
  final ValueChanged onCashbackAmountChange;

  CashbackScreen({
    required this.cashbackViewModel,
    required this.onCashbackAmountChange,
    required this.onCashbackRequest,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Balance'),
              Text(
                NumberFormat.simpleCurrency().format(cashbackViewModel.balance),
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w200),
              ),
              const SizedBox(height: 40.0),
              TextField(
                decoration:
                    InputDecoration(labelText: "Enter cash back amount"),
                // inputFormatters: [
                //   FilteringTextInputFormatter.digitsOnly,
                // ],
                keyboardType: TextInputType.number,
                onChanged: onCashbackAmountChange,
              ),
              const SizedBox(height: 40.0),
              MaterialButton(
                onPressed: cashbackViewModel.busy ? null : onCashbackRequest,
                child: cashbackViewModel.busy
                    ? CircularProgressIndicator()
                    : Text("Cashback"),
                color: Colors.green,
                disabledColor: Colors.green.withAlpha(100),
                textColor: Colors.white,
                padding: const EdgeInsets.all(8.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
