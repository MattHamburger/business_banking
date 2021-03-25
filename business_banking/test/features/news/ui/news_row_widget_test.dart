import 'package:business_banking/features/news/model/news_model.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:business_banking/features/news/ui/widgets/news_row_widget.dart';
import 'package:business_banking/features/news/ui/widgets/text_content_widget.dart';
import 'package:business_banking/features/news/ui/widgets/thumb_image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NewsRowWidget, with view model', (tester) async {
    final viewModel = NewsViewModel(
      [
        NewsModel('author', 'title', 'description', 'url', '', 'publishedAt'),
      ],
      NewsModel('selected_author', 'selected_title', 'selected_description',
          'selected_url', '', 'selected_publishedAt'),
      NewsServiceStatus.unknown,
    );
    final disclosureAction = find.byKey(Key('disclosureAction0'));
    final testWidget = MaterialApp(
      home: Scaffold(
          body: NewsRowWidget(
              viewModel: viewModel, didSelectRowAtIndex: (_) => {})),
    );
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();

    expect(find.byType(ThumbImageCard), findsNWidgets(1));
    expect(find.byType(TextContentWidget), findsNWidgets(2));
    expect(find.byType(Icon), findsNWidgets(1));
    expect(find.byType(Row), findsNWidgets(1));
    expect(find.byType(InkWell), findsNWidgets(1));
    expect(disclosureAction, findsOneWidget);
    await tester.tap(disclosureAction);
    await tester.pump();
  });
}
