import 'package:business_banking/features/contact_pay/ui/hub_card/contact_pay_hub_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactPayHubScreen extends Screen {
  final ContactPayHubActions actions;

  ContactPayHubScreen({required this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: EdgeInsets.all(5.0),
      child: Card(
        //key: Key('contactPayCard'),
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
                          'Send Money',
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
                        'Quickly send money to contacts.',
                        style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          onTap: () => {actions.navigateToContactPayScreen(context)},
        ),
      ),
    );
  }
}
