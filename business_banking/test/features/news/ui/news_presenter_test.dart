import 'package:business_banking/features/news/bloc/news_bloc.dart';
import 'package:business_banking/features/news/ui/news_presenter.dart';
import 'package:business_banking/features/news/ui/news_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('UI TEST: presenter should launch news screen', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<NewsBloc>(
          child: NewsWidget(), create: (_) => NewsBloc()),
    );

    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(NewsPresenter), findsOneWidget);
  });
}
