// Presenter: // handle the entity data and convert into view model.
// * View Model: Data shown to the screen
// * Entity: Data for the feature (services, input, calculations)

// * FeatureWidget: Adds the provider to the Presenter child
// * Presenter: Syncs the bloc with the screen, handling the view
// * Screen: Displays the view model data

import 'package:business_banking/features/cashback/bloc/cashback_bloc.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import 'cashback_form_presenter.dart';

class CashbackFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CashbackBloc>(
      create: (_) => CashbackBloc(),
      child: CashbackFormPresenter(),
    );
  }
}
