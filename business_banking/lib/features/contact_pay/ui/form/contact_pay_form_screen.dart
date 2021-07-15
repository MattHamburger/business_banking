import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/contact_pay/model/contact_pay_form_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactPayFormScreen extends Screen {
  final ContactPayFormViewModel viewModel;

  final ValueChanged<String> onCityFieldChange;

  ContactPayFormScreen(
      {required this.viewModel, required this.onCityFieldChange});

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
                        Image.asset('assets/images/bank-check.png', scale: 10),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          'Send Money to Contacts',
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
                  ),
                  SizedBox(
                    width: 350.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: () => {},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        'Send Money',
                        style: TextStyle(color: Colors.lightGreen),
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
