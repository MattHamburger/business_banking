import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HotelViewModel Test', () async {
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

    expect(luxor.title, 'Luxor');
    expect(luxor.city, 'Las Vegas');
    expect(luxor.stateCode, 'NV');
    expect(luxor.isLiked, true);
    expect(luxor.starRating, 2.5);
    expect(luxor.price, 59.99);
    expect(luxor.imageUrl,
        'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg');
    expect(luxor.props, [
      luxor.title,
      luxor.city,
      luxor.stateCode,
      luxor.isLiked,
      luxor.starRating,
      luxor.price,
      luxor.imageUrl,
    ]);

    //
    // Aria HotelViewModel
    final HotelViewModel aria = HotelViewModel(
        title: 'Aria',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: false,
        starRating: 4.7,
        price: 162.06,
        imageUrl:
            'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/aria/1024x1024_aria.jpg');

    expect(aria.title, 'Aria');
    expect(aria.city, 'Las Vegas');
    expect(aria.stateCode, 'NV');
    expect(aria.isLiked, false);
    expect(aria.starRating, 4.7);
    expect(aria.price, 162.06);
    expect(aria.imageUrl,
        'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/aria/1024x1024_aria.jpg');
    expect(aria.props, [
      aria.title,
      aria.city,
      aria.stateCode,
      aria.isLiked,
      aria.starRating,
      aria.price,
      aria.imageUrl,
    ]);
  });
}
