import 'package:business_banking/features/cashback/bloc/cashback_block.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cashback_presenter.dart';

class CashBackWidget extends StatelessWidget {
  final bool debugEnabled = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<cashbackBloc>(
      create: (_) => cashbackBloc(),
      child: CashbackPresenter(),
    );
  }
}
