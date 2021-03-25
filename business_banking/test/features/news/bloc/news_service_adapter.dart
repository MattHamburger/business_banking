import 'package:business_banking/features/news/api/news_json_response_model.dart';
import 'package:business_banking/features/news/bloc/news_service_adapter.dart';
import 'package:business_banking/features/news/model/news_entity.dart';
import 'package:business_banking/features/news/model/news_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('SERVICE ADAPTER TEST: On Success NewsEntity must be initiated and created', () {
    final entity = NewsServiceAdapter().createEntity(
        NewsEntity(),
        NewsJsonResponseModel.fromJson({
          "articles": [
            {
              "author": "author",
              "title": "title",
              "url": "url",
              "urlToImage": "urlToImage",
              "publishedAt": "publishedAt",
              "content": "content"
            }
          ]
        }));
    expect(entity.allNews.length, 1);
    expect(entity, isA<NewsEntity>());
    expect(entity.allNews[0].author, 'author');
    expect(entity.allNews[0].title, 'title');
    expect(entity.allNews[0].url, 'url');
    expect(entity.allNews[0].urlToImage, 'urlToImage');
    expect(entity.allNews[0].publishedAt, 'publishedAt');
    expect(entity.allNews[0].description, 'content');
  });
}
