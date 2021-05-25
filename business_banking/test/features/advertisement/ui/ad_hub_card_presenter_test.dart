// @dart=2.9

import 'package:business_banking/features/advertisement/bloc/ad_bloc.dart';
import 'package:business_banking/features/advertisement/ui/ad_hub_card_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AdHubCardPresenter widget test', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<AdBloc>(
        create: (_) => AdBloc(),
        child: AdHubCardPresenter(),
      ),
    ));
    expect(find.byType(AdHubCardPresenter), findsOneWidget);
  });

  testWidgets('AdHubCardPresenter widget test', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<AdBloc>(
        create: (_) => AdBloc(),
        child: AdHubCardPresenter(),
      ),
    ));
    expect(find.byType(AdHubCardPresenter), findsOneWidget);
  });
}
