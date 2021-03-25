import 'package:business_banking/features/cash_accounts/ui/cash_accounts_widget.dart';
import 'package:business_banking/features/customer/ui/customer_widget.dart';
import 'package:business_banking/features/news/ui/news_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_card.dart';
import 'package:business_banking/features/quickpay/ui/quickpay_widget.dart';
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
      body: Column(
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
          TransferFundsCard(),
          NewsWidget(),
          QuickPayWidget(),
        ],
      ),
    );
  }
}
