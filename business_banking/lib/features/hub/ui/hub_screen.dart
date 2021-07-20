import 'package:business_banking/features/budget/ui/first_card/budget_widget.dart';
import 'package:business_banking/features/credit_card/ui/credit_card/credit_card_widget.dart';
import 'package:business_banking/features/deposit_check/ui/1st_hub_card/deposit_check_card_widget.dart';
import 'package:business_banking/features/investments/ui/investments_card/investments_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class HubScreen extends Screen {
  HubScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Business Banking',
          key: Key('CAappBarName'),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
              child: Center(
                  child: Text(
                'Welcome John Doe',
                style: TextStyle(fontSize: 18),
              )),
            ),
            CreditCardWidget(),
            BudgetWidget(),
            DepositCheckCardWidget(),
            InvestmentsWidget(),
          ],
        ),
      ),
    );
  }
}
