import 'package:flutter_test/flutter_test.dart';

import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';

void main() {
  test('HotelListViewModel Test', () async {
    //
    // Luxor HotelViewModel
    final HotelViewModel luxor = HotelViewModel(
        title: 'Luxor',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: true,
        starRating: 2.5,
        price: 59.99,
        imageUrl:
            'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg');

    final List<HotelViewModel> hotels = [luxor];

    final HotelsListViewModel hotelsViewModel =
        HotelsListViewModel(hotels: hotels);

    expect(hotelsViewModel.hotels, hotels);

    expect(hotelsViewModel.props, [hotelsViewModel.hotels]);
  });
}
