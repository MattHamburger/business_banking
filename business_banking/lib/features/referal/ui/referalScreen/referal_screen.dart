import 'package:business_banking/features/referal/model/referal_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class referalScreen extends Screen {
  final ReferalViewModel viewModel;
  final ValueChanged<String> onEmailChanged;

  final Function onAddAmount;

  referalScreen(
      {required this.viewModel,
      required this.onAddAmount,
      required this.onEmailChanged});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Referal"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Column(
                    children: <Widget>[
                      Text("Amount to be gained"),
                      Text(viewModel.amount.toString()),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Divider(),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: <Widget>[
                      Text("Amount gained"),
                      Text("0.0\$"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                      suffixStyle: TextStyle(color: Colors.orangeAccent),
                      labelText: 'Name'),
                  keyboardType: TextInputType.emailAddress,
                ),
                Divider(
                  height: 10,
                ),
                TextFormField(
                  cursorColor: Colors.blue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      errorStyle: TextStyle(color: Colors.red, fontSize: 12),
                      suffixStyle: TextStyle(color: Colors.orangeAccent),
                      labelText: 'Contact Email'),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (email) => onEmailChanged(email),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 350.0,
                    height: 40.0,
                    child: OutlinedButton(
                      onPressed: () => {onAddAmount(context)},
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: Text(
                        'Refer a Friend',
                        style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// Text('Send money to'),
// Text(viewModel.name),
// TextField(
// onChanged: (val) => {
// {onNameChange(val), print("Name has changed")}
// },
// ),
