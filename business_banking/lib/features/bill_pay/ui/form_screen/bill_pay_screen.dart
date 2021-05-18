import 'dart:io';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'bill_pay_presenter.dart';

class BillPayScreen extends Screen {
  final BillPayViewModel viewModel;
  final BillPayPresenterActions presenterActions;

  BillPayScreen({required this.viewModel, required this.presenterActions});

  @override
  Widget build(BuildContext context) {
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
              presenterActions.popNavigationListener(context);
            },
            key: Key('Bill-Pay-Back-Button'),
          ),
          title: AutoSizeText(
            'PAY BILLS',
            maxFontSize: 16,
            minFontSize: 10,
          ),
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                child: Text(
                  "Pay a bill",
                  style: TextStyle(color: Colors.black54, fontSize: 36),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          key: Key('Bill-Pay-Bill-List'),
                          itemCount: viewModel.allBills.length,
                          itemBuilder: (BuildContext context, int index) {
                            DateTime dueDate = viewModel.allBills[index].due;
                            bool overdue = dueDate.isBefore(DateTime.now());
                            String dueString = (overdue) ? "OVERDUE:" : "Due:";
                            DateFormat format = DateFormat("'$dueString' MMMM d'${getDayOfMonthSuffix(dueDate.day)}' 'at' h:mm a");
                            String formatDate = format.format(dueDate);
                            return Padding(
                              padding: (viewModel.selectedBillIndex == index)
                                  ? EdgeInsets.all(0)
                                  : EdgeInsets.all(8.0),
                              child: Card(
                                key: Key('Bill-Pay-Screen-Card-$index'),
                                shape: (viewModel.selectedBillIndex == index)
                                    ? RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(color: Colors.green, width: 4)
                                      )
                                    : null,
                                color: (viewModel.selectedBillIndex == index)
                                    ? Colors.white70
                                    : Colors.white,
                                child: ListTile(
                                  contentPadding: (viewModel.selectedBillIndex == index)
                                      ? EdgeInsets.all(16)
                                      : EdgeInsets.all(8),
                                  title: Column(
                                    children: [
                                      Text(
                                        "${viewModel.allBills[index].payee}",
                                        style: TextStyle(
                                            color: Colors.green[900],
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(height: 10,)
                                    ],
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Divider(thickness: 2,),
                                      SizedBox(height: 6,),
                                      Text("${viewModel.allBills[index].memo}: "
                                      "\$${viewModel.allBills[index].amount.toStringAsFixed(2)}"),
                                      SizedBox(height: 6,),
                                      Text("$formatDate", style: TextStyle(
                                        color: overdue ? Colors.red : Colors.black54
                                      ),)
                                    ],
                                  ),
                                  onTap: () {
                                    if (viewModel.selectedBillIndex == index) {
                                      //User is deselecting the bill
                                      presenterActions.onBillSelectedListener(-1);
                                    } else {
                                      presenterActions.onBillSelectedListener(index);
                                    }
                                  },
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                    ],
                  )
                ),
              ),
              SizedBox(height: 10),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5.0)
                    ]),
                child: Center(
                  child: Text(
                    '''The amount due will be withdrawn from your primary billing account.''',
                    style: TextStyle(color: Colors.black54, fontSize: 17),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    key: Key('Bill-Pay-Confirm-Button'),
                    child: Text(
                      'Confirm Payment',
                      style: TextStyle(
                          color: viewModel.selectedBillIndex == -1
                              ? Colors.grey
                              : Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        side: BorderSide(width: 2, color:
                        viewModel.selectedBillIndex == -1
                            ? Colors.grey
                            : Colors.green)),
                    onPressed: () {
                      presenterActions.onTapConfirmBtn(context, viewModel);
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
  }

  //https://stackoverflow.com/questions/23308682/how-do-you-format-the-day-of-the-month-to-say-11th-21st-or-23rd-in-dart
  String getDayOfMonthSuffix(int dayNum) {
    if(!(dayNum >= 1 && dayNum <= 31)) {
      //doesn't need test coverage since this is a dev error
      throw Exception('Invalid day of month');
    }

    if(dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch(dayNum % 10) {
      case 1: return 'st';
      case 2: return 'nd';
      case 3: return 'rd';
      default: return 'th';
    }
  }
}
