import 'package:business_banking/features/hotels/api/hotels_service.dart';
import 'package:business_banking/features/hotels/api/hotels_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HotelsService creation', () async {
    final service = HotelsService();
    expect(service.path, 'hotels');
  });

  test('HotelsService parseResponse', () async {
    //
    final json = {
      "totalResults": 1,
      "hotels": [
        {
          "title": "Luxor",
          "city": "Las Vegas",
          "state_code": "NV",
          "is_liked": "false",
          "star_rating": 4.5,
          "price": 78.06,
          "image_url":
              "https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg"
        }
      ]
    };

    final service = HotelsService();
    HotelsServiceResponseModel response = service.parseResponse(json);
    expect(response, isA<HotelsServiceResponseModel>());
  });
}
