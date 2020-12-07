import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:business_banking/features/mortgage/ui/mortgage_card/mortgage_presenter.dart';
import 'package:business_banking/features/mortgage/ui/mortgage_card/mortgage_widget.dart';

void main() {
  testWidgets('Test mortgage widget', (tester) async {
    final testWidget = MaterialApp(home: MortgageWidget());
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(MortgagePresenter), findsOneWidget);

    await tester.tap(find.byType(MortgagePresenter));
  });
}
