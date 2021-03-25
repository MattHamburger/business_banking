import 'package:business_banking/features/news/bloc/news_usecase.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'USECASE TEST: On success NewsUsecase create should publish NewsViewModel',
      () async {
    NewsUsecase useCase = NewsUsecase((viewModel) {
      expect(viewModel, isA<NewsViewModel>());
    });
    useCase.create();
    useCase.create();
  });

  test('USECASE TEST: Should assert when callback is null', () async {
    try {
      NewsUsecase(null);
      expect(false, true);
    } catch (error) {
      expect(error, isA<AssertionError>());
    }
  });
}
