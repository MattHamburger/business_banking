import 'package:business_banking/features/investments/bloc/investments_bloc.dart';
import 'package:business_banking/features/investments/ui/investments_details/investments_details_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class InvestmentsDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<InvestmentsBloc>(
      create: (_) => InvestmentsBloc(),
      child: InvestmentsDetailsPresenter(),
    );
  }
}
