import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:business_banking/features/mortgage/ui/mortgage_detail/mortgage_detail_widget.dart';

void main() {
  testWidgets('Test mortgage detail widget', (tester) async {
    final testWidget = MaterialApp(home: MortgageDetailWidget());
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(MortgageDetailWidget), findsOneWidget);
  });
}
