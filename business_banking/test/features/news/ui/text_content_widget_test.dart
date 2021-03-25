import 'package:business_banking/features/news/ui/widgets/text_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TextContentWidget, with some test of style title', (tester) async {
    final testWidget = MaterialApp(home: TextContentWidget(text:'some text',style: TextContentStyle.title,));
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(Text), findsNWidgets(1));
  });
}
