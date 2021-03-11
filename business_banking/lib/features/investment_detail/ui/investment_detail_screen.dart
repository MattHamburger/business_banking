// dart
import 'dart:ui';
// package
import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
// internal
import '../model/investment_detail_view_model.dart';
import '../model/stock_contribution_model.dart';

class InvestmentDetailScreen extends Screen {
  final InvestmentDetailViewModel viewModel;
  final VoidCallback navigateToAccountDetail;

  InvestmentDetailScreen(
      {@required this.viewModel, @required this.navigateToAccountDetail})
      : assert(() {
          return viewModel != null;
        }());

  double width;
  double sizeItem;

  @override
  Widget build(BuildContext build) {
    width = MediaQuery.of(build).size.width;
    sizeItem = width / 5.4;
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        appBar: AppBar(
          backgroundColor: Colors.green,
          leading: GestureDetector(
            child: Icon(
              Icons.chevron_left,
              size: 40.0,
            ),
            onTap: () {
              navigateToAccountDetail();
            },
            key: Key('investment-detail-backButton'),
          ),
          title: AutoSizeText(
            'INVESTMENT ACCOUNT',
            maxFontSize: 16,
            minFontSize: 10,
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                "Account Balance",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
              SizedBox(height: 10),
              Text(
                '\$${viewModel.accountBalance}',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '\$${viewModel.totalGainValue} (${viewModel.totalGainPercent}%)',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 24),
              ),
              ListView.separated(
                key: Key('item-list-key'),
                padding: EdgeInsets.only(top: 10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: viewModel.investments.length,
                separatorBuilder: (context, index) {
                  return Container(
                    color: Colors.black54,
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.only(right: 5),
                      child: Column(
                        children: [
                          index == 0
                              ? titles(Key('detail-list-header'))
                              : Container(),
                          items(viewModel.investments[index])
                        ],
                      ));
                },
              ),
              SizedBox(
                height: 50,
              )
            ],
          )),
        ));
  }

  Widget titles(Key key) {
    return Column(
      key: key,
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: EdgeInsets.only(right: 5, left: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title('Symbol'),
                // SizedBox(
                //   width: 1,
                // ),
                title('Day\nGain \$'),
                title('Day\nGain %'),
                title('Price'),
                title('Market\nValue'),
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          width: width,
          color: Colors.black54,
          height: .7,
        )
      ],
    );
  }

  Widget title(String value) {
    return Flexible(
        // width: sizeItem,
        child: AutoSizeText(
      value,
      minFontSize: 10,
      maxFontSize: 16,
      style: TextStyle(color: Colors.black54, fontSize: 16),
    ));
  }

  Widget items(StockContributionModel listModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          // width: sizeItem,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: setInvestmentColor(listModel.dayGainValue),
                width: 8,
                height: 55,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AutoSizeText(
                    listModel.symbol,
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.ltr,
                    minFontSize: 10,
                    maxFontSize: 18,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  AutoSizeText(
                    listModel.count.toString(),
                    minFontSize: 10,
                    maxFontSize: 18,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.black54,
                width: 1,
                height: 55,
              ),
            ],
          ),
        ),
        Flexible(
          child: AutoSizeText(
            listModel.dayGainValue.toString(),
            minFontSize: 10,
            maxFontSize: 18,
            style: TextStyle(
                color: setInvestmentColor(listModel.dayGainValue),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        Flexible(
          // width:sizeItem,
          child: AutoSizeText(
            '${listModel.dayGainPercent}%',
            minFontSize: 10,
            maxFontSize: 18,
            style: TextStyle(
                color: setInvestmentColor(listModel.dayGainValue),
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ),
        Flexible(
          child: AutoSizeText(
            listModel.price.toString(),
            minFontSize: 10,
            maxFontSize: 18,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Flexible(
          child: AutoSizeText(
            listModel.marketValue.toString(),
            minFontSize: 10,
            maxFontSize: 18,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  Color setInvestmentColor(double dayGainValue) {
    if (dayGainValue.toString().startsWith('-')) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
