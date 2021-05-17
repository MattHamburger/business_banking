import 'package:business_banking/features/hotels/model/hotel_entity.dart';
import 'package:business_banking/features/hotels/model/hotels_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HotelListEntity Test', () async {
    //
    // Luxor HotelViewModel
    final HotelEntity luxor = HotelEntity(
        title: 'Luxor',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: true,
        starRating: 2.5,
        price: 59.99,
        imageUrl:
            'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg');

    final List<HotelEntity> hotels = [luxor];

    final HotelsListEntity listEntity = HotelsListEntity(allHotels: hotels);

    expect(listEntity.allHotels, hotels);
    expect(listEntity.props, [listEntity.errors, listEntity.allHotels]);
  });
}
