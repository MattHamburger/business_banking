// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:business_banking/features/hotels/ui/hotels_hub/hotels_hub_widget.dart';

void main() {
  Widget testWidget;

  setUp(() {
    testWidget = MaterialApp(
      home: HotelsHubWidget(),
    );
  });

  tearDown(() {
    testWidget = null;
  });

  testWidgets('HotelsHubWidget initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(HotelsHubWidget), findsOneWidget);
  });
}
