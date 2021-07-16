import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/contact_pay/model/form/contact_pay_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactPayFormScreen extends Screen {
  final ContactPayFormViewModel viewModel;

  final ValueChanged<String> onPayAmountChanged;
  final ValueChanged<String> onContactEmailChanged;
  final Function onSendMoneyButtonPressed;

  ContactPayFormScreen(
      {required this.viewModel,
      required this.onPayAmountChanged,
      required this.onContactEmailChanged,
      required this.onSendMoneyButtonPressed});

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
      body: Column(
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
                        Text(
                          'Send Money to Contacts' +
                              viewModel.paymentAmount.toString() +
                              ', ' +
                              viewModel.contactEmail,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  TextFormField(
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                        prefixIcon: Icon(Icons.attach_money_outlined),
                        suffixStyle: TextStyle(color: Colors.orangeAccent),
                        labelText: 'Amount'),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    onChanged: (payAmount) => onPayAmountChanged(payAmount),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}')),
                    ],
                  ),
                  TextFormField(
                    cursorColor: Colors.blue,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                        prefixIcon: Icon(Icons.email_outlined),
                        suffixStyle: TextStyle(color: Colors.orangeAccent),
                        labelText: 'Contact Email'),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (email) => onContactEmailChanged(email),
                  ),
                  SizedBox(
                    width: 350.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: () => {onSendMoneyButtonPressed(context)},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        'Send',
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
      ),
    );
  }
}
