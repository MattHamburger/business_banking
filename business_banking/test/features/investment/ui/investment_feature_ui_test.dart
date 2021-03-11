import 'package:business_banking/features/investment/bloc/investment_bloc.dart';
import 'package:business_banking/features/investment/ui/investment_feature.dart';
import 'package:business_banking/features/investment/ui/investment_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/investment_bloc_mock.dart';

void main() {
  MaterialApp testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: BlocProvider<InvestmentBlockMock>(
        create: (_) => InvestmentBlockMock(),
        child: InvestmentFeatureWidget(),
      ),
    );
  });

  group('Investment Card', () {
    testWidgets('should shows the presenter', (tester) async {
      // pumpWidget calls runApp, and also triggers a frame to paint the app.
      await tester.pumpWidget(testWidget);
      //pump trigger a rebuild since the data-loading process will happen post-runApp.
      await tester.pump(Duration(milliseconds: 500));

      final widgetType = find.byType(InvestmentPresenter);
      expect(widgetType, findsOneWidget);
    });

    testWidgets('should show \"Investment Account Balance\" at title of card',
        (tester) async {
      // pumpWidget calls runApp, and also triggers a frame to paint the app.
      await tester.pumpWidget(testWidget);
      //pump trigger a rebuild since the data-loading process will happen post-runApp.
      await tester.pump(Duration(milliseconds: 500));

      final Finder finder = find.text('Investment Account Balance');
      expect(finder, findsWidgets);
    });

    testWidgets(
        'should show \"Investment Account Balance\" at top of detail amount',
        (tester) async {
      // pumpWidget calls runApp, and also triggers a frame to paint the app.
      await tester.pumpWidget(testWidget);
      //pump trigger a rebuild since the data-loading process will happen post-runApp.
      await tester.pump(Duration(milliseconds: 500));

      final Finder finder = find.text('Account value / Today\'s net change');
      expect(finder, findsWidgets);
    });
  });
}
