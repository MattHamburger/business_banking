import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/ui/budget_feature_actions.dart';
import 'package:business_banking/features/budget/ui/widgets/account_info_widget.dart';
import 'package:business_banking/features/budget/ui/widgets/list_transactions_widget.dart';
import 'package:business_banking/features/budget/ui/widgets/donut_auto_label_chart.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class ViewChartScreen extends Screen {
  final _scaffoldkey = new GlobalKey<ScaffoldState>();
  final BudgetViewModel viewModel;
  final BudgetFeatureActions actions;

  ViewChartScreen({required this.viewModel, required this.actions});

  bottomSheet() {
    List<dynamic> categoryList = viewModel.allTransactions
        .map((array) => array.category)
        .toSet()
        .toList();

    // to avoid multiple insertions
    if (categoryList.length > 0 && categoryList.first != 'Show All') {
      // insert
      categoryList.insert(0, 'Show All');
    }
    return BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Container(
          height: categoryList.length * 70.0,
          color: Colors.lightGreen,
          child: ListView(
            children: <Widget>[
              ButtonBar(
                children: <Widget>[CloseButton()],
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: categoryList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    onPressed: () =>
                        actions.selectCategory(categoryList[index], context),
                    child: Text(
                      categoryList[index],
                      style: TextStyle(fontSize: 14.0, color: Colors.white),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Account Details'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          AccountInfoWidget(
              nickname: viewModel.accountInfo?.accountNickname ?? '',
              balance: viewModel.accountInfo?.availableBalance.toString() ?? '',
              accountNumber: viewModel.accountInfo?.accountNumber ?? ''),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
            child: Center(
                child: Text(
              'Your Spendings',
              style: TextStyle(fontSize: 18),
            )),
          ),
          Container(
            child: ConstrainedBox(
                constraints: BoxConstraints.loose(
                  Size(
                    double.infinity,
                    MediaQuery.of(context).size.width / 1.8,
                  ),
                ),
                child: DonutAutoLabelChart(
                    seriesList: viewModel.chartData, animate: false)),
          ),
          Divider(),
          OutlinedButton(
            onPressed: () {
              _scaffoldkey.currentState?.showBottomSheet(
                (context) {
                  return bottomSheet();
                },
              );
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))),
            ),
            child: const Text("Select Category"),
          ),
          ListTransactionsWidget(viewModel: this.viewModel),
        ],
      ),
    );
  }
}
