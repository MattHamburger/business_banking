import 'package:business_banking/features/billpay/ui/billpay_widget.dart';
import 'package:business_banking/features/cash_accounts/ui/cash_accounts_widget.dart';
import 'package:business_banking/features/promos/ui/promos_widget.dart';
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
            child: Center(
                child: Text(
              'Welcome John Doe',
              style: TextStyle(fontSize: 18),
            )),
            height: 80,
          ),
          CashAccountsWidget(),
          SizedBox(height: 15),
          PromosWidget(),
          SizedBox(height: 15,),
          _payBillBtn(context),
        ],
      ),
    );
  }

  _payBillBtn(BuildContext context) {
    return RaisedButton(
      key: Key('BtnPayBill'),
      color: Colors.green,
      onPressed: () async {
        _navigateToBillPayScreen(context);
      },
      child: Text(
        'Pay Bill',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  void _navigateToBillPayScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: 'BillPayFeatureWidget'),
        builder: (context) => BillPayFeatureWidget(),
      ),
    );
  }
}
