import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class CheckDepositConfirmationViewModel extends Equatable implements ViewModel {
  final String toAccount;
  final String amount;
  final DateTime date;
  final String id;

  CheckDepositConfirmationViewModel(
      {this.toAccount, this.amount, this.date, this.id})
      : assert(amount != null && date is DateTime);

  @override
  List<Object> get props => [toAccount, amount, date, id];

  @override
  String toString() {
    return "$toAccount $amount $date $id ";
  }
}
