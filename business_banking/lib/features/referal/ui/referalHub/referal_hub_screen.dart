import 'package:business_banking/features/referal/ui/referalHub/referal_hub_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class referalHubScreen extends Screen {
  final ReferalActions actions;

  referalHubScreen({required this.actions});

  @override
  Widget build(BuildContext context) {
    return referalHubCard(
      actions: this.actions,
    );
  }
}

class referalHubCard extends StatelessWidget {
  final ReferalActions actions;

  referalHubCard({required this.actions});

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
            child: Center(child: Text('Refer a fried for a bonus')),
          ),
          onTap: () => {actions.navigateToCreditCardDetails(context)},
        ),
      ),
    );
  }
}
