import 'package:business_banking/features/news/model/news_entity.dart';
import 'package:business_banking/features/news/model/news_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('ENTITY TEST: On Success NewsEntity should be initialized', () async {
    final entity = NewsEntity(allNews: [
      NewsModel(
          'author', 'title', 'description', 'url', 'urlToImage', 'publishedAt')
    ]);
    expect(entity.props, [[], entity.allNews, entity.selectedNews]);
    expect(entity.stringify, true);
    expect(entity.allNews.first.author, 'author');
    expect(entity.allNews.first.title, 'title');
    expect(entity.allNews.first.description, 'description');
    expect(entity.allNews.first.url, 'url');
    expect(entity.allNews.first.urlToImage, 'urlToImage');
    expect(entity.allNews.first.publishedAt, 'publishedAt');
    final merged = entity.merge(errors: null);
    expect(merged.errors, []);
    expect(entity.selectedItem(0), isA<NewsModel>());
  });

  test('ENTITY TEST: On Success NewsEntity should be merged with error', () async {
    final entity = NewsEntity(allNews: [
      NewsModel(
          'author', 'title', 'description', 'url', 'urlToImage', 'publishedAt')
    ]);
    final merged = entity.merge(errors: [GeneralEntityFailure()]);
    expect(merged.hasErrors(), true);
    expect(merged.errors.first, isA<GeneralEntityFailure>());
  });

  test('ENTITY TEST: Merged with an selected News object', () async {
    final entity = NewsEntity(allNews: [
      NewsModel(
          'author', 'title', 'description', 'url', 'urlToImage', 'publishedAt')
    ]);

    final selectedNews = NewsModel('selected_author', 'selected_title', 'selected_description',
        'selected_url', 'selected_urlToImage', 'selected_publishedAt');

    final merged = entity.merge(selectedNews: selectedNews);
    expect(merged.selectedNews.author, 'selected_author');
    expect(merged.selectedNews.title, 'selected_title');
    expect(merged.selectedNews.description, 'selected_description');
    expect(merged.selectedNews.url, 'selected_url');
    expect(merged.selectedNews.urlToImage, 'selected_urlToImage');
    expect(merged.selectedNews.publishedAt, 'selected_publishedAt');
  });
}
