import 'package:business_banking/features/news/api/news_json_response_model.dart';
import 'package:business_banking/features/news/api/news_service.dart';
import 'package:business_banking/features/news/model/news_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class NewsServiceAdapter extends ServiceAdapter<NewsEntity, JsonRequestModel,
    NewsJsonResponseModel, NewsService> {
  NewsServiceAdapter() : super(NewsService());

  @override
  NewsEntity createEntity(
          NewsEntity initialEntity, NewsJsonResponseModel responseModel) =>
      NewsEntity(allNews: responseModel.allNews);
}
