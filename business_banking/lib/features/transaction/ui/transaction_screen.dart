import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:business_banking/features/transaction/ui/transaction_tile.dart';

import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends Screen {
  final TransactionViewModel viewModel;
  const TransactionScreen({
    @required this.viewModel,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AutoSizeText('Transactions',
                  style: TextStyle(color: Colors.lightGreen, fontSize: 30.0)),
              Expanded(
                  child: ListView.separated(
                itemCount: viewModel.transactionDetails.length,
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.green,
                  );
                },
                itemBuilder: (context, index) {
                  return TransactionTile(
                      viewModel: viewModel.transactionDetails[index]);
                },
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    key: Key('transaction_bar_button'),
                    onPressed: () => CFRouterScope.of(context)
                        .push(BusinessBankingRouter.transactionBarChartRoute),
                    child: Text(
                      'View Bar Chart',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  const SizedBox(width: 5),
                  RaisedButton(
                    key: Key('transaction_pie_button'),
                    onPressed: () => CFRouterScope.of(context)
                        .push(BusinessBankingRouter.transactionPieChartRoute),
                    child: Text(
                      'View Pie Chart',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
