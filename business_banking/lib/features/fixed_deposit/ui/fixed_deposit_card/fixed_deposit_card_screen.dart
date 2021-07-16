import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';

class FixedDepositCardScreen extends Screen {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 75.0,
      child: InkWell(
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.money),
              Text("Fixed Deposit"),
            ],
          ),
        ),
        onTap: () => CFRouterScope.of(context)
            .popUntil(BusinessBankingRouter.creditCardDetailsRoute),
      ),
    );
  }
}
