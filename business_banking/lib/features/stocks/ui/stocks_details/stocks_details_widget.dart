import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks/ui/stocks_details/stocks_details_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class StocksDetailsWidget extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    //print("CreditCardPaymentResponseWidget.build " + context.hashCode.toString());
    return BlocProvider<StocksBloc>(
      create: (_) => StocksBloc(),
      child: StocksDetailsPresenter(),
    );
  }

}