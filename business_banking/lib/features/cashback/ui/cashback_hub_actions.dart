import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

import '../../../routes.dart';

class CashbackHubActions {
  void navigateToCashbackScreen(BuildContext context) {
    CFRouterScope.of(context)
        .push(BusinessBankingRouter.cashBackMainScreenRoute);
  }
}
