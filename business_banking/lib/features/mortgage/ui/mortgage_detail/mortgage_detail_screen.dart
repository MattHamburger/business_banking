import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/mortgage_detail_view_model.dart';

class MortgageDetailScreen extends Screen {
  final MortgageDetailViewModel viewModel;

  MortgageDetailScreen({@required this.viewModel})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text('Mortgage Details'),
          key: Key('mortgageDetailsAppBar')),
      body: Column(
        children: [
          Row(
            children: [Text('Loan Number: '), Text(viewModel.loanNum)],
          ),
          Row(
            children: [
              Text('Escrow Balance: '),
              Text(viewModel.escrowBalanceString),
            ],
          ),
          Row(
            children: [
              Text('Fees charged: '),
              Text(viewModel.feesChargedString)
            ],
          ),
        ],
      ),
    );
  }
}
