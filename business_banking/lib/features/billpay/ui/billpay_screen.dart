import 'package:business_banking/features/billpay/model/billpay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BillPayScreen extends Screen {
  //
  final BillPayViewModel viewModel;
  final Function startPayTap;
  final Function onChangeBillPayAmount;

  BillPayScreen({
    this.viewModel,
    this.startPayTap,
    this.onChangeBillPayAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Bill Pay',
          key: Key('CBillPayAppBarTitle'),
        ),
        leading: IconButton(
          key: Key('BillPayBackBtn'),
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Center(
                child: Text(
              'Welcome',
              key: Key('WelcomeTextKey'),
              style: TextStyle(fontSize: 18),
            )),
            height: 80,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BillPayUI(
                viewModel: viewModel,
                startPayTap: startPayTap,
                onChangeBillPayAmount: onChangeBillPayAmount,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BillPayUI extends StatelessWidget {
  const BillPayUI({
    Key key,
    @required this.viewModel,
    this.startPayTap,
    this.onChangeBillPayAmount,
  }) : super(key: key);

  final BillPayViewModel viewModel;
  final Function startPayTap;
  final Function onChangeBillPayAmount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          _textFormField(
            Key('bill_pay_amount_tf_key'),
            "Pay Amount",
            onChangeBillPayAmount,
            TextInputType.number,
          ),
          FlatButton(
            key: Key('PayBtn'),
            onPressed: () {
              FocusScope.of(context).unfocus();
              startPayTap();
            },
            child: Text('Pay'),
          )
        ],
      ),
    );
  }

  Widget _textFormField(Key key, String hintText, Function onChangeTextField,
      TextInputType textInputType) {
    return TextFormField(
      key: key,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.payment),
        filled: true,
        hintText: hintText,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 2.0)),
      ),
      onChanged: (value) {
        onChangeTextField(value);
      },
    );
  }
}
