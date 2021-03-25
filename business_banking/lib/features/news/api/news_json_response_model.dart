import 'package:business_banking/features/news/model/news_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class NewsJsonResponseModel implements JsonResponseModel {
  final List<NewsModel> allNews;

  NewsJsonResponseModel(this.allNews);

  NewsJsonResponseModel.fromJson(Map<String, dynamic> json)
      : allNews = (json["articles"] as List)
            .map((i) => new NewsModel.fromJson(i))
            .toList();

  @override
  // implement props
  List<Object> get props => [allNews];

  @override
  // implement stringify
  bool get stringify => false;
}
