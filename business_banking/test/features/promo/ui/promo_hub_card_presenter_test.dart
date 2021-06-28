import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AdHubCardPresenter widget test', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<PromoBloc>(
        create: (_) => PromoBloc(),
        child: PromoHubCardPresenter(),
      ),
    ));
    expect(find.byType(PromoHubCardPresenter), findsOneWidget);
  });

  testWidgets('AdHubCardPresenter widget test', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<PromoBloc>(
        create: (_) => PromoBloc(),
        child: PromoHubCardPresenter(),
      ),
    ));
    expect(find.byType(PromoHubCardPresenter), findsOneWidget);
  });
}
