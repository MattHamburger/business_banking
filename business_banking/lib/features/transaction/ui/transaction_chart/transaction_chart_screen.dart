import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:business_banking/features/transaction/ui/category_colors.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:clean_framework/clean_framework.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

import '../../enums.dart';
import '../../extensions.dart';

class TransactionChartScreen extends Screen {
  final TransactionViewModel viewModel;
  final VoidCallback navigateToHubScreen;

  TransactionChartScreen({
    @required this.viewModel,
    @required this.navigateToHubScreen,
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
            navigateToHubScreen();
          },
          key: Key('backButton'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText("Transaction Details"),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: DonutPieChart(viewModel: viewModel),
                  )),
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.all(8.0), child: CategoryColors()))
        ],
      ),
    );
  }
}

class DonutPieChart extends StatelessWidget {
  final bool animate;
  final TransactionViewModel viewModel;

  const DonutPieChart({this.animate = true, this.viewModel});

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      _generateTransactionData(),
      animate: animate,
      defaultRenderer: charts.ArcRendererConfig(
        strokeWidthPx: 1,
        arcRatio: 0.55,
        arcLength: 2 * pi,
        arcRendererDecorators: [
          charts.ArcLabelDecorator(
              showLeaderLines: true,
              labelPosition: charts.ArcLabelPosition.auto,
              labelPadding: 0,
              outsideLabelStyleSpec: charts.TextStyleSpec(fontSize: 9),
              insideLabelStyleSpec: charts.TextStyleSpec(
                  fontSize: 9,
                  color: charts.Color.fromHex(code: "#FFFFFF"),
                  lineHeight: 1))
        ],
      ),
      layoutConfig: charts.LayoutConfig(
        leftMarginSpec: charts.MarginSpec.fixedPixel(0),
        topMarginSpec: charts.MarginSpec.fixedPixel(0),
        rightMarginSpec: charts.MarginSpec.fixedPixel(0),
        bottomMarginSpec: charts.MarginSpec.fixedPixel(0),
      ),
    );
  }

  List<charts.Series<TransactionModel, double>> _generateTransactionData() {
    final List<TransactionModel> data = viewModel.transactionDetails;

    return [
      charts.Series<TransactionModel, double>(
        id: 'Transactions',
        domainFn: (TransactionModel transaction, _) =>
            transaction.transactionAmount,
        measureFn: (TransactionModel transaction, _) =>
            transaction.transactionAmount,
        data: data,
        colorFn: (TransactionModel transaction, _) =>
            charts.ColorUtil.fromDartColor(EnumToString.fromString(
                    TransactionCategory.values, transaction.transactionCategory)
                .color),
        labelAccessorFn: (TransactionModel transaction, _) =>
            transaction.transactionCategory.capitalize(),
      )
    ];
  }
}
