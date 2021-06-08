import 'dart:ui';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:business_banking/features/bills/model/bills_view_model.dart';
import 'package:intl/intl.dart';
import 'bill_list_actions.dart';

class BillListScreen extends Screen {
  final BillsViewModel viewModel;
  final BillListActions actions;
  
  BillListScreen({required this.viewModel, required this.actions});
  
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
        ),
        title: Text('List of bills'),
      ),
      body: ListView.builder(
        itemCount: viewModel.bills.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
            child: Card(
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pay to:', style: TextStyle(fontSize: 15.0)),
                        Text(viewModel.bills[index].orderTo, style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Is paid:', style: TextStyle(fontSize: 15.0)),
                        Text(viewModel.bills[index].isPaid? 'Yes': 'No', style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Amount:', style: TextStyle(fontSize: 15.0)),
                        Text(viewModel.bills[index].amount.toStringAsFixed(2), style: TextStyle(fontSize: 15.0)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Due date:', style: TextStyle(fontSize: 15.0)),
                        Text(
                          DateFormat.MMMd().format(viewModel.bills[index].dueAt),
                          style: TextStyle(fontSize: 15.0)
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Paid:', style: TextStyle(fontSize: 15.0)),
                        viewModel.bills[index].isPaid? Text(
                          DateFormat.MMMd().format(viewModel.bills[index].paidAt),
                          style: TextStyle(fontSize: 15.0)
                        ): Text('Not paid'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}