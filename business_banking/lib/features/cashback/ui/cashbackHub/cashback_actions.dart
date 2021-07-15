import 'package:business_banking/features/cashback/bloc/cashback_block.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';

class CashBackActions {
  void navigateToCreditCardDetails(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.cashBackDetailsRoute);
  }
}
