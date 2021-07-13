import 'package:business_banking/features/cashback/ui/cashback_hub_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CashbackHubScreen extends Screen {
  final CashbackHubActions actions;

  CashbackHubScreen({required this.actions});

  @override
  Widget build(BuildContext context) {
    return CashbackHubCard(
      actions: this.actions,
    );
  }
}

class CashbackHubCard extends StatelessWidget {
  final CashbackHubActions actions;

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Cash Back',
                          key: Key('cashBackCardName'),
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  thickness: 2,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'You are not eligible for cash back.',
                        style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () => {actions.navigateToCashbackScreen(context)},
        ),
      ),
    );
  }
}
