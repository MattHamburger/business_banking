import 'package:business_banking/features/advertisement/api/ad_service.dart';
import 'package:business_banking/features/advertisement/api/ad_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AdService created', () async {
    AdService service = AdService();
    expect(service.path, 'ads');
  });

  test('AdService parses response', () async {
    final jsonResponse = {
      'adTitle': 'Amazing Deal',
      'adDescription': 'details about the deal'
    };
    final service = AdService();
    AdServiceResponseModel responseModel = service.parseResponse(jsonResponse);
    expect(responseModel, AdServiceResponseModel.fromJson(jsonResponse));
  });

  test('AdService GET request', () async {
    AdService service = AdService();
    final response = await service.request();
    expect(response.isRight, isTrue);
  });
}
