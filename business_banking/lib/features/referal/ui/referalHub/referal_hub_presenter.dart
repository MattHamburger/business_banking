import 'package:business_banking/features/referal/ui/referalHub/referal_hub_actions.dart';
import 'package:business_banking/features/referal/ui/referalHub/referal_hub_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class referalHubPresenter extends StatelessWidget {
  // Should be presenter, but that has its own requirements

  @override
  Widget build(BuildContext context) {
    return referalHubScreen(
      actions: ReferalActions(),
    );
  }
}
