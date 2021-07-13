import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CashbackScreen extends Screen {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: AutoSizeText(
          'CASH BACK',
          maxFontSize: 16,
          minFontSize: 10,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Cash Back option not implemented yet.',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
