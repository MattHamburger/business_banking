import 'package:business_banking/features/cash_accounts/ui/cash_accounts_widget.dart';
import 'package:business_banking/features/quickpay/ui/quickpay_widget.dart';
import 'package:business_banking/features/transaction/ui/transaction_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_card.dart';

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
            CashAccountsWidget(),
            //PromosWidget(),
            SizedBox(height: 15),
            TransactionWidget(),
            SizedBox(height: 30),
            SizedBox(height: 15),
            TransferFundsCard(),
            SizedBox(height: 15),
            QuickPayWidget(),
          ],
        ),
      ),
    );
  }
}
