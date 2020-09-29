import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class MortgageAccountDetailScreen extends Screen {
  final MortgageAccountDetailViewModel viewModel;
  final VoidCallback navigateToMortgageAccounts;

  MortgageAccountDetailScreen({@required this.viewModel, @required this.navigateToMortgageAccounts})
      : assert(() {
    return viewModel != null;
  }());

  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          child: Icon(
            Icons.chevron_left,
            size: 40.0,
          ),
          onTap: () {
            navigateToMortgageAccounts();
          },
          key: Key('mortagageDetailsBackButton'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              viewModel.name,
            ),
            Text(
              '*' + viewModel.lastFour,
              key: Key('mortagageDetailsAppBarL4'),
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('account balance'),
              Text(
                '\$' + viewModel.balance.toStringAsFixed(2),
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w200),
                key: Key('mortagageAccountDetailBalance'),
              ),
              const SizedBox(height: 40.0),
              // Beginning Balance Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Beginning Balance:', style: TextStyle(fontSize: 15.0)),
                  Text('\$' + viewModel.beginningBalance.toStringAsFixed(2), style: TextStyle(fontSize: 15.0))
                ],
              ),
              const SizedBox(height: 10.0),
              // Pending Transactions Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('Pending Transactions:', style: TextStyle(fontSize: 15.0)), pendingCheck(viewModel.pendingTransactions)],
              ),
              const SizedBox(height: 10.0),
              // Deposit Holds Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Deposit Holds:', style: TextStyle(fontSize: 15.0)),
                  Text('\$' + viewModel.depositHolds.toStringAsFixed(2), style: TextStyle(fontSize: 15.0), key: Key('mortagageDepositHold'))
                ],
              ),
              const SizedBox(height: 10.0),
              // Account Balance Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Account Balance:', style: TextStyle(fontSize: 15.0)),
                  Text('\$' + viewModel.balance.toStringAsFixed(2), style: TextStyle(fontSize: 15.0))
                ],
              ),
              const SizedBox(height: 10.0),
              Divider(
                thickness: 1.0,
                color: Colors.black38,
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Account Type: ' + viewModel.accountType, style: TextStyle(fontSize: 15.0)),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Application Number: ' + viewModel.applicationNumber.toString(), style: TextStyle(fontSize: 15.0)),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Account Number: ••••••' + viewModel.lastFour, style: TextStyle(fontSize: 15.0)),
                  Text(
                    'Show',
                    style: TextStyle(decoration: TextDecoration.underline, fontSize: 15.0),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Text pendingCheck(double pendingTransactions) {
  if (pendingTransactions >= 0.00) {
    return Text('\$' + pendingTransactions.toStringAsFixed(2), style: TextStyle(fontSize: 15.0));
  } else {
    return Text('-\$' + pendingTransactions.toStringAsFixed(2).substring(1),
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.red));
  }
}
