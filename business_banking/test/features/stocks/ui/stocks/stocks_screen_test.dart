// @dart=2.9
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/features/stocks/ui/stocks/stocks_actions.dart';
import 'package:business_banking/features/stocks/ui/stocks/stocks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class StocksActionsMock extends Mock implements StocksActions {}

void main() {

  StocksViewModel viewModel;
  StocksActionsMock actions;
  Widget testWidget;

  setUp(() {
    viewModel = StocksViewModel(
        stockPrices: List<StockPrice>.of({StockPrice(
            id: "1",
            companyName: "Apple",
            last: 127.45,
            high: 127.89,
            low: 125.85,
            change: 2.48,
            volume: "81.92M")}, growable: false)
    );
    actions = StocksActionsMock();
    testWidget = MaterialApp(
      home: StocksScreen(
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

  testWidgets('StocksScreen initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(StocksScreen), findsOneWidget);
  });

  testWidgets('StocksScreen actions',
          (tester) async {

        await tester.pumpWidget(testWidget);
        await tester.pump(Duration(milliseconds: 500));

        /// navigateToStocksDetails
        var widget = find.byKey(Key('stocks'));
        expect(widget, findsOneWidget);
        await tester.tap(widget);
        verify(actions.navigateToStocksDetails(any)).called(1);

      });
}