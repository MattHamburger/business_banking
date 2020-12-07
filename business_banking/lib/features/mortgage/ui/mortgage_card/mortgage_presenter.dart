import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import '../../bloc/mortgage_bloc.dart';
import '../../model/mortgage_view_model.dart';
import 'mortgage_screen.dart';
import '../mortgage_detail/mortgage_detail_widget.dart';

class MortgagePresenter
    extends Presenter<MortgageBloc, MortgageViewModel, MortgageScreen> {
  @override
  Stream<MortgageViewModel> getViewModelStream(MortgageBloc bloc) {
    return bloc.mortgageViewModelPipe.receive;
  }

  @override
  MortgageScreen buildScreen(
      BuildContext context, MortgageBloc bloc, MortgageViewModel viewModel) {
    return MortgageScreen(
      viewModel: viewModel,
      navigateToMortgageDetail: () {
        _navigateToMortgageDetail(context);
      },
    );
  }

  void _navigateToMortgageDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: 'MortgageDetailWidget'),
        builder: (context) => MortgageDetailWidget(),
      ),
    );
  }
}
