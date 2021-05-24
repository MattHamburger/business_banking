import 'package:business_banking/features/new_cards/bloc/new_cards_bloc.dart';
import 'package:business_banking/features/new_cards/ui/new_cards_presenter.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';


class NewCardsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewCardsBloc>(
      create: (_) => NewCardsBloc(),
      child: NewCardsPresenter(),
    );
  }
}
