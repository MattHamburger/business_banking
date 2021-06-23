import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/bills/bloc/bills_bloc.dart';
import 'package:business_banking/features/bills/model/bills_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'bills_actions.dart';
import 'bills_screen.dart';

class BillsPresenter extends Presenter<BillsBloc, BillsViewModel, BillsScreen> {
  @override
  Stream<BillsViewModel> getViewModelStream(BillsBloc bloc) {
    return bloc.billsViewModelPipe.receive;
  }
  
  @override
  BillsScreen buildScreen(BuildContext context, BillsBloc bloc, BillsViewModel viewModel) {
    return BillsScreen(viewModel: viewModel, actions: BillsActions(bloc));
  }
}