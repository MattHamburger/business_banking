import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';

class OffersListActions {
  final CFRouter? _router;

  // router parameter: testing only.
  OffersListActions({CFRouter? router}) : _router = router;

  void navigateBack(BuildContext context) {
    final router = _router ?? CFRouterScope.of(context);
    router.popUntil(BusinessBankingRouter.hubRoute);
  }
}
