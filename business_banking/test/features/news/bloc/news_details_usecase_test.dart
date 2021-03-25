import 'package:business_banking/features/news/bloc/news_details_usecase.dart';
import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:business_banking/features/news/model/news_entity.dart';
import 'package:business_banking/features/news/model/news_model.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'USECASE TEST: On success NewsDetailsUseCase create should publish NewsViewModel',
      () async {
    final entity = NewsEntity(allNews: [
      NewsModel(
          'author', 'title', 'description', 'url', 'urlToImage', 'publishedAt')
    ]);

    final selectedNews = NewsModel(
        'selected_author',
        'selected_title',
        'selected_description',
        'selected_url',
        'selected_urlToImage',
        'selected_publishedAt');

    final merged = entity.merge(selectedNews: selectedNews);

    ExampleLocator()
        .repository
        .create<NewsEntity>(merged, (_) {}, deleteIfExists: true);
    await Future.delayed(Duration(milliseconds: 200));

    NewsDetailsUseCase useCase = NewsDetailsUseCase((viewModel) {
      expect(viewModel, isA<NewsDetailsViewModel>());
    });
    useCase.create();
    useCase.create();
  });

  test(
      'USECASE TEST: On success NewsDetailsUseCase create should publish NewsDetailsViewModel',
      () async {
    final entity = NewsEntity(allNews: [
      NewsModel(
          'author', 'title', 'description', 'url', 'urlToImage', 'publishedAt')
    ]);

    final selectedNews = NewsModel(
        'selected_author',
        'selected_title',
        'selected_description',
        'selected_url',
        'selected_urlToImage',
        'selected_publishedAt');

    final merged = entity.merge(selectedNews: selectedNews);

    ExampleLocator()
        .repository
        .create<NewsEntity>(merged, (_) {}, deleteIfExists: true);
    await Future.delayed(Duration(milliseconds: 200));

    NewsDetailsUseCase useCase = NewsDetailsUseCase((viewModel) {
      expect(viewModel, isA<NewsDetailsViewModel>());
    });
    useCase.create();
    useCase.create();
  });

  test(
      'USECASE TEST: On success NewsDetailsViewModel should be created using entity',
      () async {
    final entity = NewsEntity(
        allNews: [
          NewsModel('author', 'title', 'description', 'url', 'urlToImage',
              'publishedAt')
        ],
        selectedNews: NewsModel(
            'selected_author',
            'selected_title',
            'selected_description',
            'selected_url',
            'selected_urlToImage',
            'selected_publishedAt'));

    ExampleLocator()
        .repository
        .create<NewsEntity>(entity, (_) {}, deleteIfExists: true);
    await Future.delayed(Duration(milliseconds: 200));

    NewsDetailsUseCase useCase = NewsDetailsUseCase((viewModel) {
      expect(viewModel, isA<NewsDetailsViewModel>());
    });
    useCase.create();
    final modelWithEntity = useCase.buildViewModelForSelectedNews(entity);
    expect(modelWithEntity, isA<NewsDetailsViewModel>());
  });

  test('USECASE TEST: Should assert when callback is null', () async {
    try {
      NewsDetailsUseCase(null);
      expect(false, true);
    } catch (error) {
      expect(error, isA<AssertionError>());
    }
  });
}
