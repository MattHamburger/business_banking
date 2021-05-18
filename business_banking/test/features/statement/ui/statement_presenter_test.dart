// @dart=2.9
import 'package:business_banking/features/budget/ui/chart/view_chart_presenter.dart';
import 'package:business_banking/features/budget/ui/chart/view_chart_widget.dart';
import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_presenter.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_widget.dart';
import 'package:business_banking/features/statement/ui/statement/statement_presenter.dart';
import 'package:business_banking/features/statement/ui/statement/statement_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UI TEST: should add StatementPresenter to widget tree',
      (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<StatementBloc>(
          child: StatementWidget(), create: (_) => StatementBloc()),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(StatementPresenter), findsOneWidget);
  });

  testWidgets('UI TEST: should add StatementCardPresenter to widget tree',
      (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<StatementBloc>(
          child: StatementCardWidget(), create: (_) => StatementBloc()),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(StatementCardPresenter), findsOneWidget);
  });
}
