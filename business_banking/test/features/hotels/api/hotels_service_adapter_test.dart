import 'package:business_banking/features/hotels/api/hotels_service_adapter.dart';
import 'package:business_banking/features/hotels/api/hotels_service_response_model.dart';
import 'package:business_banking/features/hotels/model/hotel_entity.dart';
import 'package:business_banking/features/hotels/model/hotels_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    //
    final entity = HotelsServiceAdapter().createEntity(
        HotelsListEntity(),
        HotelsServiceResponseModel.fromJson({
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
        }));

    final HotelEntity hotel = HotelEntity(
        title: "Luxor",
        city: "Las Vegas",
        stateCode: "NV",
        isLiked: false,
        starRating: 4.5,
        price: 78.06,
        imageUrl:
            "https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg");
    final List<HotelEntity> list = [hotel];
    final newEntity = HotelsListEntity(allHotels: list);

    expect(entity, newEntity);
  });
}
