import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:business_banking/features/news/ui/news_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('NewsDetailsScreen, with view model- short author name', (tester) async {
    final viewModel = NewsDetailsViewModel(
        author: 'author',
        title: 'title',
        description: 'description',
        url: 'url',
        urlToImage: '',
        publishedAt: '2021-03-22T14:26:50Z');
    final testWidget = MaterialApp(home: NewsDetailsScreen(viewModel: viewModel));
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(Stack), findsNWidgets(2));
  });

  testWidgets('NewsDetailsScreen, with view model - author name exceeds 10 chars', (tester) async {
    final viewModel = NewsDetailsViewModel(
        author: 'some lengthy author name to test',
        title: 'title',
        description: 'description',
        url: 'url',
        urlToImage: '',
        publishedAt: '2021-03-22T14:26:50Z');
    final testWidget = MaterialApp(home: NewsDetailsScreen(viewModel: viewModel));
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(Stack), findsNWidgets(2));
  });
}
