// @dart=2.9

import 'package:business_banking/features/advertisement/bloc/ad_bloc.dart';
import 'package:business_banking/features/advertisement/ui/ad_details/ad_details_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AdDetailsPresenter Widget test', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<AdBloc>(
        create: (_) => AdBloc(),
        child: AdDetailsPresenter(),
      ),
    ));
    expect(find.byType(AdDetailsPresenter), findsOneWidget);
  });
}
