import 'package:business_banking/features/cashback/ui/cashbackHub/cashback_actions.dart';
import 'package:business_banking/features/cashback/ui/cashbackHub/cashback_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashbackPresenter extends StatelessWidget {
  // Should be presenter, but that has its own requirements

  @override
  Widget build(BuildContext context) {
    return CashbackHubScreen(
      actions: CashBackActions(),
    );
  }
}
