import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

import '../../../../routes.dart';

class ContactPayHubActions {
  void navigateToContactPayScreen(BuildContext context) {
    CFRouterScope.of(context)
        .push(BusinessBankingRouter.contactPayMainScreenRoute);
  }
}
