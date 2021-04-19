import 'package:business_banking/features/transaction/enums.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionTile extends StatelessWidget {
  final TransactionModel viewModel;
  const TransactionTile({Key key, @required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionCategory category = EnumToString.fromString(
        TransactionCategory.values, viewModel.transactionCategory);
    return Card(
        elevation: 2,
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          title: Row(
            children: [
              Container(
                color: category.color,
                height: 25,
                width: 2,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              ),
              Text(viewModel.transactionTitle),
            ],
          ),
          trailing: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$' + viewModel.transactionAmount.toStringAsFixed(2),
                  style: TextStyle(
                      color: viewModel.debit ? Colors.red : Colors.green),
                ),
                Text(DateFormat('MM/dd/yyyy').format(viewModel.date))
              ],
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child:
                Text(EnumToString.convertToString(category, camelCase: true)),
          ),
        ));
  }
}
