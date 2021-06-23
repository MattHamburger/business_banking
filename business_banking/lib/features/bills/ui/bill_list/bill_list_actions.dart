import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import '../../../../routes.dart';
import 'package:business_banking/features/bills/bloc/bills_bloc.dart';
import 'package:business_banking/features/bills/model/bills_view_model.dart';

class BillListActions {
  final BillsBloc bloc;
  final BillsViewModel viewMode;

  BillListActions(this.bloc, this.viewMode);
        
  void navigateBack(BuildContext context) async {
    CFRouterScope.of(context).popUntil(BusinessBankingRouter.hubRoute);
  }
}