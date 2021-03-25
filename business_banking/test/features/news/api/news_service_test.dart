import 'package:business_banking/features/news/api/news_json_response_model.dart';
import 'package:business_banking/features/news/api/news_service.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:test/test.dart';

void main() {
  logger().setLogLevel(LogLevel.verbose);
  //prerequisite - Mockoon 'news' api should be running
  test('API TESTS:On success news service should return Instance of NewsJsonResponseModel', () async {
    final service = NewsService();
    final eitherResponse = await service.request();
    expect(eitherResponse.isRight, isTrue);
    expect(eitherResponse.fold((_) {}, (m) => m), isA<NewsJsonResponseModel>());
  });
}
