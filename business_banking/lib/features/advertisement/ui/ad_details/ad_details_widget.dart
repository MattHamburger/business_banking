import 'package:business_banking/features/advertisement/bloc/ad_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

import 'ad_details_presenter.dart';

class AdDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdBloc>(
        create: (_) => AdBloc(), child: AdDetailsPresenter());
  }
}
