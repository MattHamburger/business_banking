import 'package:business_banking/features/news/api/news_json_response_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class NewsService
    extends EitherService<JsonRequestModel, NewsJsonResponseModel> {
  NewsService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'news');

  @override
  NewsJsonResponseModel parseResponse(Map<String, dynamic> jsonResponse) =>
      NewsJsonResponseModel.fromJson(jsonResponse);
}
