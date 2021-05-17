import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import 'hotels_main_presenter.dart';
import 'package:business_banking/features/hotels/bloc/hotels_bloc.dart';

class HotelsMainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return BlocProvider<HotelsBloc>(
      create: (_) => HotelsBloc(),
      child: HotelsMainPresenter(),
    );
  }
}
