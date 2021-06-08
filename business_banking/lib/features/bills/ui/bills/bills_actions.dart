import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:business_banking/features/bills/bloc/bills_bloc.dart';
import '../../../../routes.dart';

class BillsActions {
        final BillsBloc bloc;
        
        BillsActions(this.bloc);
        
        void navigateToBillList(BuildContext context) {
          CFRouterScope.of(context).push(BusinessBankingRouter.billListRoute);
        }
}