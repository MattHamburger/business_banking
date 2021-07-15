import 'package:business_banking/features/cashback/ui/cashbackHub/cashback_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CashbackHubScreen extends Screen {
  final CashBackActions actions;

  CashbackHubScreen({required this.actions});

  @override
  Widget build(BuildContext context) {
    return CashbackHubCard(
      actions: this.actions,
    );
  }
}

class CashbackHubCard extends StatelessWidget {
  final CashBackActions actions;

  CashbackHubCard({required this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: EdgeInsets.all(5.0),
      child: Card(
        key: Key('cashBackCard'),
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: InkWell(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Center(child: Text('Cash Back')),
          ),
          onTap: () => {actions.navigateToCreditCardDetails(context)},
        ),
      ),
    );
  }
}
