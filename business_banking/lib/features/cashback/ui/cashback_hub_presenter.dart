import 'package:business_banking/features/cashback/ui/cashback_hub_actions.dart';
import 'package:business_banking/features/cashback/ui/cashback_hub_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashbackHubPresenter extends StatelessWidget {
  // Should be presenter, but that has its own requirements

  @override
  Widget build(BuildContext context) {
    return CashbackHubScreen(
      actions: CashbackHubActions(),
    );
  }
}
