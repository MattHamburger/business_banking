import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CashbackPresenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(64.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Balance'),
            Text(
              NumberFormat.simpleCurrency().format(0.00),
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w200),
            ),
            const SizedBox(height: 40.0),
            TextField(
              decoration: InputDecoration(labelText: "Enter cash back amount"),
            ),
            const SizedBox(height: 40.0),
            MaterialButton(
              onPressed: () {},
              child: Text("Cashback"),
              color: Colors.green,
              textColor: Colors.white,
            )
          ],
        ),
      ),
    ));
  }
}
