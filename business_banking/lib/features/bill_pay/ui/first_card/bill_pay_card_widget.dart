import 'package:business_banking/features/bill_pay/bloc/bill_pay_bloc.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';

import 'bill_pay_card_presenter.dart';

class BillPayCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BillPayBloc>(
      create: (_) => BillPayBloc(),
      child: BillPayCardPresenter(),
    );
  }
}
