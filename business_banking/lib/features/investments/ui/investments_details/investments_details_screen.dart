import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/investments/model/investments_details/investments_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'investments_details_presenter.dart';

class InvestmentsDetailsScreen extends Screen {
  final InvestmentsDetailsViewModel viewModel;
  final InvestmentsDetailsPresenterActions presenterAction;

  final Function? onStockTextChanged;
  final Function? onSubmit;

  InvestmentsDetailsScreen({
    this.onStockTextChanged,
    this.onSubmit,
    required this.viewModel,
    required this.presenterAction,
  });
  final _form = GlobalKey<FormState>();
  final _emailFNode = FocusNode();
  final _depositAmountTxtedCtrl = TextEditingController();
  final _stockSymboxTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _stockSymboxTextEditingController.text = viewModel.symbol!;

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
              presenterAction.popNavigationListener(context);
            },
            key: Key('Deposit-Check-Back-Button'),
          ),
          title: AutoSizeText(
            'INVESTMENTS',
            maxFontSize: 16,
            minFontSize: 10,
          ),
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: SingleChildScrollView(
              key: Key('Scroll-View-Key'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Form(
                        key: _form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Theme(
                                  data: Theme.of(context).copyWith(
                                    primaryColor: Colors.green,
                                    textSelectionTheme: TextSelectionThemeData(
                                        selectionHandleColor: Colors.green,
                                        selectionColor: Colors.green),
                                  ),
                                  child: TextFormField(
                                    controller:
                                        _stockSymboxTextEditingController,
                                    focusNode: _emailFNode,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        prefixIcon: Icon(Icons.search),
                                        errorStyle: TextStyle(
                                            color: Colors.red, fontSize: 12),
                                        suffixStyle: TextStyle(
                                            color: Colors.orangeAccent),
                                        labelText: 'Search stock symbol...'),
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (val) {
                                      if (_form.currentState != null) {
                                        _form.currentState!.save();
                                      }

                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                    },
                                    onChanged: (val) =>
                                        onStockTextChanged!(val),
                                    // onSaved: (val) => presenterAction
                                    //     .onUserEmailSavedListener(val ?? ''),
                                  )),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(height: 20),
                  SizedBox(height: 20),
                  viewModel.quote?.symbol != null
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: double.infinity,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Card(
                              elevation: 3,
                              color: Colors.yellow,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 45.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(viewModel.quote?.symbol ?? ''),
                                      Text(
                                          'Stock Price ${double.tryParse(viewModel.quote?.bidPrice ?? '0')}' ??
                                              ''),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        key: Key('Deposit-Check-Confirm-Button'),
                        child: Text(
                          'Search',
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            side: BorderSide(width: 2, color: Colors.green)),
                        onPressed: () {
                          onSubmit?.call();
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              )),
        ));
  }
}
