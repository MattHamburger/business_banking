import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/features/stocks/ui/stocks/stocks_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StocksScreen extends Screen {
  final StocksViewModel viewModel;
  final StocksActions actions;

  StocksScreen({
    required this.viewModel,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    if (viewModel.serviceResponseStatus == ServiceResponseStatus.succeed){
      return Container(
        height: 125,
        padding: EdgeInsets.all(5.0),
        child: Card(
          key: Key('stocks'),
          color: Colors.white,
          shadowColor: Colors.grey[500],
          elevation: 3.0,
          child: InkWell(
            child: Center(
                child: const Text(
                  'Stocks',
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
                )
            ),
            onTap: () {
              this.actions.navigateToStocksDetails(context);
            },
          )
          ),
        );
    }else{
      return Container(
        height: 125,
        padding: EdgeInsets.all(5.0),
        child: Card(
            key: Key('stocks'),
            color: Colors.white,
            shadowColor: Colors.grey[500],
            elevation: 3.0,
            child: InkWell(
              child: Center(
                  child: const Text(
                    'Stocks Service is not available',
                    style: TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  )
              ),
            )
        ),
      );
    }

  }

}