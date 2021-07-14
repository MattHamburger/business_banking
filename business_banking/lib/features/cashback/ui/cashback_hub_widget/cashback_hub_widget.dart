import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

// make this tapabble and navigate to the Feature Widget
class CashbackHubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text("go"),
        onPressed: () => CFRouterScope.of(context)
            .push(BusinessBankingRouter.cashbackRoute));
  }
}
