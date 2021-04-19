import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/account_detail/model/account_detail_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class AccountDetailScreen extends Screen {
  final AccountDetailViewModel viewModel;
  final VoidCallback navigateToCashAccounts;

  AccountDetailScreen({
    @required this.viewModel,
    @required this.navigateToCashAccounts,
  }) : assert(() {
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
              navigateToCashAccounts();
            },
            key: Key('backButton'),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText("Account Title"),
              Text(
                '...0000',
                key: Key('ADappBarL4'),
              )
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Column(children: [
              /// Account Balance Top-Most Section
              Container(child: createAccountBalanceSection()),

              /// Account Transaction Details Card(s)
              Container(
                child: createTransactionSections(),
              ),

              /// Account Transaction Details Card(s)
              Container(
                child: createTransactionSections(),
              ),

              /// Account Transaction Details Card(s)
              Container(
                child: createTransactionSections(),
              ),

              /// Account Transaction Details Card(s)
              Container(
                child: createTransactionSections(),
              ),

              /// View More Transactions Button
              Container(
                child: createViewMoreTransactionsButton(),
              ),
            ]),
          ],
        ));
  }
}

/// This method creates the top most Account Balance Section
/// of the Transaction Details View.
Column createAccountBalanceSection() {
  var _usdCurrency = new NumberFormat("#,##0.00", "en_US");

  return Column(children: [
    Text('Current Balance'),
    Text(
      '\$' + _usdCurrency.format(123456.12),
      style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w200),
      key: Key('bigBalance'),
    ),
    const SizedBox(height: 40.0),
    // Beginning Balance Row
    const SizedBox(height: 10.0),
    // Pending Transactions Row
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Pending Transactions:', style: TextStyle(fontSize: 15.0)),
        pendingCheck(999.99)
      ],
    ),
    const SizedBox(height: 10.0),
    // Deposit Holds Row
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Deposit Holds:', style: TextStyle(fontSize: 15.0)),
        Text('\$' + (222.22).toStringAsFixed(2),
            style: TextStyle(fontSize: 15.0), key: Key('depHold'))
      ],
    ),
    const SizedBox(height: 10.0),
    // Account Balance Row
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Account Balance:', style: TextStyle(fontSize: 15.0)),
        Text('\$' + (5555.55).toStringAsFixed(2),
            style: TextStyle(fontSize: 15.0))
      ],
    ),
    const SizedBox(height: 10.0),
    Divider(
      thickness: 1.0,
      color: Colors.black38,
    ),
  ]);
}

/// This method creates each Column Object for the most recent
/// 5 Transaction Details.
Card createTransactionSections() {
  return Card(
    color: Colors.white,
    shadowColor: Colors.grey[500],
    elevation: 3.0,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Transaction Amount
          Row(
            children: [
              Expanded(
                child: Text(
                  "Transaction Amount",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AutoSizeText(
                "\$542.22",
                style: TextStyle(
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),

          /// Transaction Date
          Row(
            children: [
              Expanded(
                child: Text(
                  "Transaction Date",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AutoSizeText(
                "09/09/2020",
                style: TextStyle(
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),

          /// Purchase
          Row(
            children: [
              Expanded(
                child: Text(
                  "Purchase",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                child: Text(
                  "Mac Book Pro with Retina Display -- Brand New",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),

          /// Telephone Contact
          Row(
            children: [
              Expanded(
                child: Text(
                  "Telephone",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AutoSizeText(
                "1-888-123-4444",
                style: TextStyle(
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),

          /// Address
          Row(
            children: [
              Expanded(
                child: Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
                child: Text(
                  "123 Disneyland Ave. Anaheim, CA 90211",
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

/// This method creates the "View More Transactions" button
FlatButton createViewMoreTransactionsButton() {
  return FlatButton(
    color: Colors.lightGreen,
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
    onPressed: () {
      /// Navigate to the Transactions Filtering Page.
      /// ToDo()
    },
    child: Text(
      "View More Transactions",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}

Text pendingCheck(double pendingTransactions) {
  if (pendingTransactions >= 0.00) {
    return Text('\$' + pendingTransactions.toStringAsFixed(2),
        style: TextStyle(fontSize: 15.0));
  } else {
    return Text('-\$' + pendingTransactions.toStringAsFixed(2).substring(1),
        style: TextStyle(
            fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.red));
  }
}
