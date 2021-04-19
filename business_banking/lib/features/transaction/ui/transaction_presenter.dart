import 'dart:async';
import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:business_banking/features/transaction/ui/transaction_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionPresenter extends Presenter<TransactionBloc,
    TransactionViewModel, TransactionScreen> {
  @override
  Stream<TransactionViewModel> getViewModelStream(TransactionBloc bloc) {
    return bloc.transactionDetailsViewModelPipe.receive;
  }

  @override
  TransactionScreen buildScreen(BuildContext context, TransactionBloc bloc,
      TransactionViewModel viewModel) {
    return TransactionScreen(viewModel: viewModel);
  }
}
