import 'package:business_banking/features/cashback/bloc/cashback/cashback_bloc.dart';
import 'package:business_banking/features/cashback/model/cashback_viewmodel.dart';
import 'package:business_banking/features/cashback/ui/cashback/cashback_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/src/widgets/framework.dart';

class CashbackPresenter
    extends Presenter<CashbackBloc, CashbackViewModel, CashbackScreen> {
  @override
  CashbackScreen buildScreen(
      BuildContext context, CashbackBloc bloc, CashbackViewModel viewModel) {
    return CashbackScreen(viewModel);
  }

  @override
  Stream<CashbackViewModel> getViewModelStream(CashbackBloc bloc) {
   return bloc.cashbackViewModelPipe.receive;
  }
}
