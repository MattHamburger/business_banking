import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TransactionViewModel extends ViewModel {
  final List<TransactionModel> transactionDetails;

  TransactionViewModel({@required this.transactionDetails})
      : assert(transactionDetails != null);

  @override
  List<Object> get props => [transactionDetails];
}
