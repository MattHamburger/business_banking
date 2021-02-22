import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final String title;

  LoadingScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green,
      ),
      body: Center(child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      )),
    );
  }
}