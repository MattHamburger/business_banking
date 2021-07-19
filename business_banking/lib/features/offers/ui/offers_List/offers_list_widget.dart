import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../bloc/offers_bloc.dart';
import 'offers_list_presenter.dart';

class OffersListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OffersBloc>(
      key: const Key('OffersList-bloc-provider'),
      create: (_) => OffersBloc(),
      child: OffersListPresenter(),
    );
  }
}
