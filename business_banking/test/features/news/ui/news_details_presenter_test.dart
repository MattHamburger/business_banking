import 'package:business_banking/features/news/bloc/news_bloc.dart';
import 'package:business_banking/features/news/model/news_entity.dart';
import 'package:business_banking/features/news/model/news_model.dart';
import 'package:business_banking/features/news/ui/news_details_presenter.dart';
import 'package:business_banking/features/news/ui/news_details_widget.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UI TEST: presenter should launch news details screen',
      (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<NewsBloc>(
          child: NewsDetailsWidget(), create: (_) => NewsBloc()),
    );

    final entity = NewsEntity(
        allNews: [
          NewsModel('author', 'title', 'description', 'url', '',
              '2021-03-25T22:05:00Z')
        ],
        selectedNews: NewsModel(
            'selected_author',
            'selected_title',
            'selected_description',
            'selected_url',
            '',
            '2021-03-25T22:05:00Z'));

    ExampleLocator()
        .repository
        .create<NewsEntity>(entity, (_) {}, deleteIfExists: true);

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(NewsDetailsPresenter), findsOneWidget);
  });
}
