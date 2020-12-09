import 'package:business_banking/features/bill_pay/ui/bill_pay_info_widget.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_widget.dart';
import 'package:business_banking/features/promos/ui/promos_widget.dart';
import 'package:business_banking/features/customer/ui/customer_widget.dart';
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
        key: Key("scroll_view"),
        child: Column(
          children: [
            Container(
              child: Center(
                  child: Text(
                'Welcome John Doe',
                style: TextStyle(fontSize: 18),
              )),
              height: 80,
            ),
            CashAccountsWidget(),
            CustomerWidget(),
            SizedBox(height: 15),
            //PromosWidget(),
            SizedBox(height: 15),
            TransferFundsCard(),
            BillPayInfoWidget(),
          ],
        ),
      ),
    );
  }
}
