// @dart=2.9

import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/features/stocks/ui/stocks_details/stocks_details_actions.dart';
import 'package:business_banking/features/stocks/ui/stocks_details/stocks_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class StocksDetailsActionsMock extends Mock  implements StocksDetailsAction {}

void main() {
  StocksViewModel viewModel;
  StocksDetailsActionsMock actions;
  Widget testWidget;

  setUp(() {
    List<StockPrice> stockPrices = List.empty(growable: true);
    stockPrices.add(StockPrice(id: "1", companyName: "Apple", last: 127.45, high: 127.89, low: 125.85, change: 2.48, volume: "81.92M"));
    stockPrices.add(StockPrice(id: "2", companyName: "Tesla", last: 589.74, high: 592.87, low: 570.46, change: 18.05, volume: "33.37M"));
    stockPrices.add(StockPrice(id: "3", companyName: "Walt Disney", last: 173.70, high: 174.91, low: 168.78, change: -4.64, volume: "33.15M"));

    viewModel = StocksViewModel(
        stockPrices: stockPrices);

    actions = StocksDetailsActionsMock();
    testWidget = MaterialApp(
      home: StocksDetailsScreen(
        viewModel: viewModel,
        actions: actions,
      ),
    );
  });

  tearDown(() {
    viewModel = null;
    actions = null;
    testWidget = null;
  });

  testWidgets('StocksDetailsScreen initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(StocksDetailsScreen), findsOneWidget);
  });

  testWidgets('StocksDetailsScreen viewModel values x screen values',
          (tester) async {
        await tester.pumpWidget(testWidget);
        await tester.pump(Duration(milliseconds: 500));

        /// stockPrices
        for(int i = 0; i < viewModel.stockPrices.length; i++) {
          expect(find.text(viewModel.stockPrices[i].companyName), findsOneWidget);
          expect(find.text(viewModel.stockPrices[i].volume), findsOneWidget);
          expect(find.text(viewModel.stockPrices[i].last.toString()), findsOneWidget);
          expect(find.text(viewModel.stockPrices[i].low.toString()), findsOneWidget);
          expect(find.text(viewModel.stockPrices[i].high.toString()), findsOneWidget);
          expect(find.text(viewModel.stockPrices[i].change.toString()), findsOneWidget);
        }

      });

  testWidgets('StocksDetailsScreen actions', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    /// navigateBack
    var widget = find.byKey(Key('backButton'));
    expect(widget, findsOneWidget);
    await tester.tap(widget);
    verify(actions.navigateBack(any)).called(1);

  });
}