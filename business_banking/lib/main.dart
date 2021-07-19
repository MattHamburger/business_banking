// @dart=2.9
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'locator.dart';
import 'routes.dart';

void main() {
  logger().setLogLevel(LogLevel.verbose);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.green, statusBarColor: Colors.green));

  runApp(
    CFRouterScope(
      routeGenerator: BusinessBankingRouter.generate,
      initialRoute: BusinessBankingRouter.updateUserProfileScreen,
      builder: (context) => MaterialApp.router(
        routeInformationParser: CFRouteInformationParser(),
        routerDelegate: CFRouterDelegate(context),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
