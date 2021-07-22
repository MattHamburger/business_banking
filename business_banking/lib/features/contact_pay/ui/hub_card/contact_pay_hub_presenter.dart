import 'package:business_banking/features/contact_pay/ui/hub_card/contact_pay_hub_actions.dart';
import 'package:business_banking/features/contact_pay/ui/hub_card/contact_pay_hub_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactPayHubPresenter extends StatelessWidget {
  // Should extend Presenter, but that has required classes/components that don't exist yet

  @override
  Widget build(BuildContext context) {
    return ContactPayHubScreen(
      actions: ContactPayHubActions(),
    );
  }
}
