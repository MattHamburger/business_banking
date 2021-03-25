import 'package:business_banking/features/news/ui/news_presenter.dart';
import 'package:business_banking/features/news/ui/news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('WIDGET TEST: NewsWidget loaded successfully!', (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: NewsWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(NewsPresenter), findsOneWidget);
  });
}