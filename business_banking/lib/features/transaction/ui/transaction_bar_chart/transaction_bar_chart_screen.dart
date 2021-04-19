import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:business_banking/features/transaction/ui/category_colors.dart';

import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'bar_chart.dart';

class TransactionBarChartScreen extends Screen {
  final TransactionViewModel viewModel;
  final VoidCallback navigateToHubScreen;

  TransactionBarChartScreen({
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
            AutoSizeText("Transaction Pie Chart"),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child:
                  Card(elevation: 5.0, child: BarChart(viewModel: viewModel)),
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
