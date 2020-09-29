import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class MortgageAccountDetailViewModel extends ViewModel {
  final String name;
  final String lastFour;
  final String accountType;
  final int applicationNumber;
  final double balance;
  final double beginningBalance;
  final double pendingTransactions;
  final double depositHolds;

  MortgageAccountDetailViewModel({
    @required this.name,
    @required this.lastFour,
    @required this.accountType,
    @required this.applicationNumber,
    @required this.balance,
    @required this.beginningBalance,
    @required this.pendingTransactions,
    @required this.depositHolds
  }) : assert(name != null &&
      lastFour != null &&
      accountType != null &&
      applicationNumber != null &&
      balance != null &&
      beginningBalance != null &&
      pendingTransactions != null &&
      depositHolds != null);
}
