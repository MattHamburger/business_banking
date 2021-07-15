import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashBackScreen extends Screen {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("CashBack"),
      ),
      body: Image(
        image: AssetImage('assets/images/under.png'),
      ),
    );
  }
}
