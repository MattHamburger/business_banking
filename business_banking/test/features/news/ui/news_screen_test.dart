import 'package:business_banking/features/news/model/news_model.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:business_banking/features/news/ui/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('News Screen pumped with News bloc', (tester) async {
    final viewModel = NewsViewModel(
      [
        NewsModel('author', 'title', 'description', 'url', '', 'publishedAt'),
      ],
      NewsModel('selected_author', 'selected_title', 'selected_description',
          'selected_url', '', 'selected_publishedAt'),
      NewsServiceStatus.unknown,
    );
    final testWidget = MaterialApp(home: NewsScreen(viewModel: viewModel));
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(Card), findsNWidgets(2));
  });
}
