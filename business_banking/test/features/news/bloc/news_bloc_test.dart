import 'package:business_banking/features/news/bloc/news_bloc.dart';
import 'package:business_banking/features/news/model/news_details_view_model.dart';
import 'package:business_banking/features/news/model/news_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  NewsBloc bloc;

  setUp(() {
    bloc = NewsBloc();
  });

  tearDown(() {
    bloc.dispose();
  });

  //prerequisite - Mockoon 'news' api should be running
  test('BLOC TEST: On success NewsBloc gets model of type NewsViewModel.', () {
    bloc.newsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<NewsViewModel>());
      expect(model.allNews.length, 5);
      expect(model.allNews[0].author, isA<String>());
      expect(model.allNews[0].title, isA<String>());
      expect(model.allNews[0].description, isA<String>());
      expect(model.allNews[0].url, isA<String>());
      expect(model.allNews[0].urlToImage, isA<String>());
      expect(model.allNews[0].publishedAt, '2021-03-04T19:26:00Z');
      bloc.didSelectRowAtIndex(0);
    }));
  });
}
