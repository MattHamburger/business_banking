import 'package:business_banking/features/investment_detail/ui/investment_detail_feature_widget.dart';
import 'package:business_banking/features/investment_detail/ui/investment_detail_presenter.dart';
import 'package:business_banking/features/investment_detail/ui/investment_detail_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/investment_detail_bloc_mock.dart';

void main() {
  MaterialApp testWidget;
  InvestmentDetailBlockMock investmentDetailBlockMock;

  setUp(() {
    investmentDetailBlockMock = InvestmentDetailBlockMock();
    testWidget = MaterialApp(
      home: BlocProvider<InvestmentDetailBlockMock>(
        create: (_) => InvestmentDetailBlockMock(),
        child: InvestmentDetailScreen(
          viewModel: investmentDetailBlockMock.investmentDetailViewModelSample,
          navigateToAccountDetail: () {
            print('user tap on back button');
          },
        ),
      ),
    );
  });

  group('Investment Detail Screen', () {
    testWidgets('should show Stock list on screen', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      await tester.pumpAndSettle();

      var stockList =
          investmentDetailBlockMock.investmentDetailViewModelSample.investments;

      for (var stock in stockList) {
        final Finder symbolFinder =
            find.text(stock.symbol, skipOffstage: false);
        await tester.ensureVisible(symbolFinder);
        expect(symbolFinder, findsOneWidget);

        final Finder priceFinder =
            find.text('${stock.price}', skipOffstage: false);
        await tester.ensureVisible(priceFinder);
        expect(priceFinder, findsOneWidget);
      }

      final finder = find.byKey(Key('investment-detail-backButton'));
      await tester.tap(finder.first);
      await tester.pumpAndSettle();
    });

    testWidgets('should print "user tap on back button"', (tester) async {
      await tester.pumpWidget(testWidget);
      await tester.pump(Duration(milliseconds: 500));

      await tester.pumpAndSettle();

      final finder = find.byKey(Key('investment-detail-backButton'));
      await tester.tap(finder.first);
      await tester.pumpAndSettle();
    });
  });
}
