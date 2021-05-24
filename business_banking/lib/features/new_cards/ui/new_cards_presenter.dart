import 'package:business_banking/features/new_cards/bloc/new_cards_bloc.dart';
import 'package:business_banking/features/new_cards/models/new_cards_view_model.dart';
import 'package:business_banking/features/new_cards/ui/new_cards_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class NewCardsPresenter
    extends Presenter<NewCardsBloc, NewCardsViewModel, NewCardsScreen> {
  @override
  Stream<NewCardsViewModel> getViewModelStream(NewCardsBloc bloc) {
    return bloc.getNewCardsViewModelPipe.receive;
  }

  @override
  NewCardsScreen buildScreen(
    BuildContext context,
    NewCardsBloc bloc,
    NewCardsViewModel viewModel,
  ) {
    return NewCardsScreen(
      viewModel: viewModel,
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ),
    );
  }
}
