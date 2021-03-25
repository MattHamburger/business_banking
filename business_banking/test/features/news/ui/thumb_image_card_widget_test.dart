import 'package:business_banking/features/news/ui/widgets/thumb_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ThumbImageCard, with empty image url', (tester) async {
    final testWidget = MaterialApp(home: ThumbImageCard(imgUrl: ''));
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(Card), findsNWidgets(1));
  });
}
