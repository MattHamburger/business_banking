import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../bloc/mortgage_bloc.dart';
import 'mortgage_detail_presenter.dart';

class MortgageDetailWidget extends StatelessWidget {
  const MortgageDetailWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => MortgageBloc(), child: MortgageDetailPresenter());
  }
}
