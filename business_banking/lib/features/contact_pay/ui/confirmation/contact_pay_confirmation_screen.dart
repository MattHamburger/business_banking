import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/contact_pay/model/confirmation/contact_pay_confirmation_view_model.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactPayConfirmationScreen extends Screen {
  final ContactPayConfirmationViewModel viewModel;

  final Function onOKButtonPressed;

  ContactPayConfirmationScreen(
      {required this.viewModel, required this.onOKButtonPressed});

  // I based the structure of this on deposit_check_screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: AutoSizeText(
          'SEND MONEY',
          maxFontSize: 16,
          minFontSize: 10,
        ),
      ),
      body: viewModel.serviceResponseStatus == ServiceResponseStatus.succeed
          ? _successWidget(
              viewModel: viewModel, onOKButtonPressed: onOKButtonPressed)
          : _failWidget(
              viewModel: viewModel, onOKButtonPressed: onOKButtonPressed),
    );
  }
}

class _successWidget extends StatelessWidget {
  const _successWidget(
      {required this.viewModel, required this.onOKButtonPressed});

  final ContactPayConfirmationViewModel viewModel;
  final Function onOKButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 350.0,
            height: 375.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Image.asset('assets/images/send_money_icon.png',
                          scale: 4),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Success!',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Confirmation ID: ' + viewModel.confirmationId,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350.0,
                  height: 40.0,
                  child: OutlinedButton(
                    onPressed: () => {onOKButtonPressed(context)},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _failWidget extends StatelessWidget {
  const _failWidget({required this.viewModel, required this.onOKButtonPressed});

  final ContactPayConfirmationViewModel viewModel;
  final Function onOKButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Center(
          child: Container(
            width: 350.0,
            height: 375.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Image.asset('assets/images/send_money_icon.png',
                          scale: 4),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Send Failed.',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Error Code: ' + viewModel.errorCode.toString(),
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350.0,
                  height: 40.0,
                  child: OutlinedButton(
                    onPressed: () => {onOKButtonPressed(context)},
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.lightGreen,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
