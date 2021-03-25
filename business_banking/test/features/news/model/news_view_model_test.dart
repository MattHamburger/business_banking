import 'package:business_banking/features/news/api/news_json_response_model.dart';
import 'package:business_banking/features/news/model/news_model.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MODEL TEST: NewsViewModel initialize', () async {
    final viewModel = NewsViewModel(
      [
        NewsModel('author', 'title', 'description', 'url', 'urlToImage',
            'publishedAt'),
      ],
      NewsModel('selected_author', 'selected_title', 'selected_description',
          'selected_url', 'selected_urlToImage', 'selected_publishedAt'),
      NewsServiceStatus.unknown,
    );

    expect(viewModel.props, [viewModel.allNews, viewModel.selectedNews, viewModel.serviceStatus]);
    expect(viewModel.stringify, true);
    expect(viewModel.allNews[0].author, 'author');
    expect(viewModel.allNews[0].title, 'title');
    expect(viewModel.allNews[0].description, 'description');
    expect(viewModel.allNews[0].url, 'url');
    expect(viewModel.allNews[0].urlToImage, 'urlToImage');
    expect(viewModel.allNews[0].publishedAt, 'publishedAt');
    expect(viewModel.selectedNews, isA<NewsModel>());
    expect(viewModel.serviceStatus, NewsServiceStatus.unknown);
  });

  test('MODEL TEST: NewsJsonResponseModel initialize', () async {
    final model = NewsJsonResponseModel([
      NewsModel(
          'author', 'title', 'description', 'url', 'urlToImage', 'publishedAt')
    ]);
    expect(model.props, [model.allNews]);
    expect(model.stringify, false);
    expect(model.allNews.first.author, 'author');
    expect(model.allNews.first.title, 'title');
    expect(model.allNews.first.description, 'description');
    expect(model.allNews.first.url, 'url');
    expect(model.allNews.first.urlToImage, 'urlToImage');
    expect(model.allNews.first.publishedAt, 'publishedAt');
  });
}
