import 'package:business_banking/features/news/model/news_model.dart';
import 'package:clean_framework/clean_framework.dart';

class NewsEntity extends Entity {
  final List<NewsModel> allNews;
  final NewsModel selectedNews;

  NewsEntity(
      {List<EntityFailure> errors = const [],
      List<NewsModel> allNews,
      NewsModel selectedNews})
      : allNews = allNews ?? [],
        selectedNews = selectedNews ?? null,
        super(errors: errors);

  @override
  List<Object> get props => [errors, allNews, selectedNews];

  @override
  NewsEntity merge({
    errors,
    List<NewsModel> allNews,
    NewsModel selectedNews,
  }) {
    return NewsEntity(
      errors: errors ?? this.errors,
      allNews: allNews ?? this.allNews,
      selectedNews: selectedNews ?? this.selectedNews,
    );
  }

  NewsModel selectedItem(int index) => allNews[index];
}
