// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:business_banking/features/hotels/ui/hotels_main/hotels_main_widget.dart';

void main() {
  Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: HotelsMainWidget(),
    );
  });

  tearDown(() {
    testWidget = null;
  });

  testWidgets('HotelsMainWidget initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(HotelsMainWidget), findsOneWidget);
  });
}
