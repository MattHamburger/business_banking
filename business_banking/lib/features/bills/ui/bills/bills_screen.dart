import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:business_banking/features/bills/model/bills_view_model.dart';
import 'package:intl/intl.dart';
import 'bills_actions.dart';

class BillsScreen extends Screen {
  final BillsViewModel viewModel;
  final BillsActions actions;
  
  BillsScreen({ required this.viewModel, required this.actions });
        
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: EdgeInsets.all(5.0),
      child: Card(
        key: Key('billsResume'),
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: InkWell(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Billing list', style: TextStyle(fontSize: 20.0,),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${viewModel.paidBillsQty.toString()} paid bill${viewModel.paidBillsQty != 1? "s:": ":"}', style: TextStyle(fontSize: 15.0)),
                    Text(viewModel.paidBillsAmount.toStringAsFixed(2), style: TextStyle(fontSize: 15.0)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${viewModel.unpaidBillsQty.toString()} pending bills:', style: TextStyle(fontSize: 15.0)),
                    Text(viewModel.unpaidBillsAmount.toStringAsFixed(2), style: TextStyle(fontSize: 15.0)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Next bill due date:', style: TextStyle(fontSize: 15.0)),
                    Text(DateFormat.MMMd().format(viewModel.nextBillPaymentDue), style: TextStyle(fontSize: 15.0)),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            actions.navigateToBillList(context);
          },
        ),
      ),
    );
  }
  
  
}