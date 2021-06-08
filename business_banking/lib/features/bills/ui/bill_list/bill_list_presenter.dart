import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/bills/bloc/bills_bloc.dart';
import 'package:business_banking/features/bills/model/bills_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'bill_list_actions.dart';
import 'bill_list_screen.dart';

class BillListPresenter extends Presenter<BillsBloc, BillsViewModel, BillListScreen> {
  @override
  Stream<BillsViewModel> getViewModelStream(BillsBloc bloc) {
    return bloc.billsViewModelPipe.receive;
  }
  
  @override
  BillListScreen buildScreen(BuildContext context, BillsBloc bloc, BillsViewModel viewModel){
    return BillListScreen(viewModel: viewModel, actions: BillListActions(bloc, viewModel));
  }
}