import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/features/stocks/ui/stocks_details/stocks_details_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StocksDetailsScreen extends Screen {
  final StocksViewModel viewModel;
  final StocksDetailsAction actions;

  StocksDetailsScreen({
    required this.viewModel,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: GestureDetector(
          child: Icon(
            Icons.chevron_left,
            size: 40.0,
          ),
          onTap: () {
            this.actions.navigateBack(context);
          },
          key: Key('backButton'),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              "Stocks",
              key: Key('titleName'),
            )
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: viewModel.stockPrices.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 175,
            child: Card(
              key: Key('stockPriceCard'),
              color: Colors.white,
              shadowColor: Colors.grey[500],
              elevation: 3.0,
              child: InkWell(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Company Name:",
                              style: TextStyle(color: Colors.black54, fontSize: 18.0),
                            ),
                            Text(
                              viewModel.stockPrices[index].companyName,
                              key: Key('stockCompanyName'),
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Volume:",
                              style: TextStyle(color: Colors.black54, fontSize: 18.0),
                            ),
                            Text(
                              viewModel.stockPrices[index].volume,
                              key: Key('stockVolume'),
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Last:",
                              style: TextStyle(color: Colors.black54, fontSize: 18.0),
                            ),
                            Text(
                              viewModel.stockPrices[index].last.toString(),
                              key: Key('stockLast'),
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Change:",
                              style: TextStyle(color: Colors.black54, fontSize: 18.0),
                            ),
                            Text(
                              viewModel.stockPrices[index].change.toString(),
                              key: Key('stockChange'),
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Low:",
                              style: TextStyle(color: Colors.black54, fontSize: 18.0),
                            ),
                            Text(
                              viewModel.stockPrices[index].low.toString(),
                              key: Key('stockLow'),
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "High:",
                              style: TextStyle(color: Colors.black54, fontSize: 18.0),
                            ),
                            Text(
                              viewModel.stockPrices[index].high.toString(),
                              key: Key('stockHigh'),
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w300),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )
    );
  }
}