import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class MortgageAccountDetailServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final String name;
  final String lastFour;
  final String accountType;
  final int applicationNumber;
  final double balance;
  final double beginningBalance;
  final double pendingTransactions;
  final double depositHolds;

  MortgageAccountDetailServiceResponseModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'Mortgage Account',
        lastFour = json['lastFour'] ?? '0000',
        accountType = json['accountType'] ?? 'Mortgage',
        applicationNumber = json['applicationNumber'] ?? 000000000,
        balance = json['balance'] ?? 0.00,
        beginningBalance = json['begBalance'] ?? 0.00,
        pendingTransactions = json['penTrans'] ?? 0.00,
        depositHolds = json['depHolds'] ?? 0.00;

  @override
  List<Object> get props => [
    name,
    lastFour,
    accountType,
    applicationNumber,
    balance,
    beginningBalance,
    pendingTransactions,
    depositHolds
  ];
}
