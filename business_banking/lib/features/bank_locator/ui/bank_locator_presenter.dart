import 'package:business_banking/features/bank_locator/ui/bank_locator_widget.dart';
import 'package:business_banking/features/bank_locator/bloc/bank_locator_bloc.dart';
import 'package:business_banking/features/bank_locator/model/bank_locator_view_model.dart';
import 'package:business_banking/features/bank_locator/ui/bank_locator_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BankLocatorPresenter extends Presenter<BankLocatorBloc,
    BankLocatorViewModel, BankLocatorScreen> {
  @override
  BankLocatorScreen buildScreen(context, bloc, viewModel) {
    return BankLocatorScreen(
      viewModel: viewModel,
      onChangeLocation: (value) =>
          _onChangeLocation(bloc, value.latitude, value.longitude),
      navigateToBankLocator: _navigateToBankLocator,
    );
  }

  void _onChangeLocation(BankLocatorBloc bloc, double lat, double lon) {
    bloc.latitudePipe.send(lat);
    bloc.longitudePipe.send(lon);
  }

  void _navigateToBankLocator(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        settings: RouteSettings(name: 'bank-locator'),
        builder: (context) => BankLocatorWidget(),
      ),
    );
  }

  @override
  Stream<BankLocatorViewModel> getViewModelStream(BankLocatorBloc bloc) =>
      bloc.bankLocatorViewModelPipe.receive;
}
