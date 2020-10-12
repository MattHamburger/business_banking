import 'dart:convert';
import 'dart:io';

import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/login/ui/login_feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'locator.dart';

void main() {
  logger().setLogLevel(LogLevel.verbose);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.green, statusBarColor: Colors.green));

  runApp(
    MaterialApp(
      home: LoginFeatureWidget(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
