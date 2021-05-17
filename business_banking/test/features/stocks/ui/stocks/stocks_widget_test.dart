// @dart=2.9

import 'package:business_banking/features/stocks/ui/stocks/stocks_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: StocksWidget(),
    );
  });

  tearDown(() {
    testWidget = null;
  });

  testWidgets('StocksWidget initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(StocksWidget), findsOneWidget);
  });
}