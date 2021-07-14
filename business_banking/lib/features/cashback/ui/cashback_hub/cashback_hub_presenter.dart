import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';

class CashbackHubPresenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          height: 100.0,
          child: Card(
            child: Center(
              child: Text("Go to Cashback Screen"),
            ),
          ),
        ),
      ),
      onTap: ()=>  CFRouterScope.of(context)
          .push(BusinessBankingRouter.cashbackScreen),
    );
  }
}
