import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';

class OffersHubActions {
  final CFRouter? _router;

  // router parameter: testing only.
  OffersHubActions({CFRouter? router}) : _router = router;

  void navigateToOffersList(BuildContext context) {
    final router = _router ?? CFRouterScope.of(context);
    router.push(BusinessBankingRouter.offersListRoute);
  }
}
