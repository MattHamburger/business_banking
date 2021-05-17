import 'package:business_banking/features/hotels/api/hotels_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HotelServiceResponseModel Test', () async {
    HotelsServiceResponseModel model;
    model = HotelsServiceResponseModel.fromJson({
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
    });

    final HotelInfo luxor = model.allHotels.first;

    expect(luxor.title, 'Luxor');
    expect(luxor.city, 'Las Vegas');
    expect(luxor.stateCode, 'NV');
    expect(luxor.isLiked, false);
    expect(luxor.starRating, 4.5);
    expect(luxor.price, 78.06);
    expect(luxor.imageUrl,
        'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg');
  });
}
