import 'package:business_banking/features/referal/bloc/referal_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';

class ReferalActions {
  void navigateToCreditCardDetails(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.cashBackDetailsRoute);
  }
}
