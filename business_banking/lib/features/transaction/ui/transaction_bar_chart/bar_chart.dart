import 'package:business_banking/features/transaction/enums.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BarChart extends StatelessWidget {
  final bool animate;
  final TransactionViewModel viewModel;
  final simpleCurrencyFormatter =
      charts.BasicNumericTickFormatterSpec.fromNumberFormat(
          NumberFormat.compactSimpleCurrency());

  BarChart({this.animate = true, this.viewModel});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(_generateTransactionData(),
        animate: animate,
        primaryMeasureAxis:
            charts.NumericAxisSpec(tickFormatterSpec: simpleCurrencyFormatter),
        defaultRenderer: charts.BarRendererConfig(
            cornerStrategy: const charts.ConstCornerStrategy(30)));
  }

  List<charts.Series<TransactionModel, String>> _generateTransactionData() {
    final List<TransactionModel> data = viewModel.transactionDetails;

    return [
      charts.Series<TransactionModel, String>(
        id: 'Transactions-Bar',
        domainFn: (TransactionModel transaction, _) =>
            DateFormat('MM/dd/yyyy').format(transaction.date),
        measureFn: (TransactionModel transaction, _) =>
            transaction.transactionAmount,
        data: data,
        colorFn: (TransactionModel transaction, _) =>
            charts.ColorUtil.fromDartColor(EnumToString.fromString(
                    TransactionCategory.values, transaction.transactionCategory)
                .color),
      )
    ];
  }
}
