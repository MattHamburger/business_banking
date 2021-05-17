import 'package:flutter_test/flutter_test.dart';
import 'package:business_banking/features/hotels/model/hotel_entity.dart';

void main() {
  test('HotelEntity init with null values', () async {
    final HotelEntity entity = HotelEntity();

    expect(entity.title, '');
    expect(entity.city, '');
    expect(entity.stateCode, '');
    expect(entity.isLiked, false);
    expect(entity.starRating, 0.0);
    expect(entity.price, 0.00);
    expect(entity.imageUrl, '');

    expect(entity.props, [
      entity.errors,
      entity.title,
      entity.city,
      entity.stateCode,
      entity.isLiked,
      entity.starRating,
      entity.price,
      entity.imageUrl,
    ]);
  });

  test('HotelEntity init with real values', () async {
    final HotelEntity entity = HotelEntity(
        title: 'Luxor',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: true,
        starRating: 2.5,
        price: 59.99,
        imageUrl:
            'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg');

    expect(entity.title, 'Luxor');
    expect(entity.city, 'Las Vegas');
    expect(entity.stateCode, 'NV');
    expect(entity.isLiked, true);
    expect(entity.starRating, 2.5);
    expect(entity.price, 59.99);
    expect(entity.imageUrl,
        'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg');

    expect(entity.props, [
      entity.errors,
      entity.title,
      entity.city,
      entity.stateCode,
      entity.isLiked,
      entity.starRating,
      entity.price,
      entity.imageUrl,
    ]);
  });

  test('HotelEntity merge', () async {
    final HotelEntity luxorEntity = HotelEntity(
        title: 'Luxor',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: false,
        starRating: 2.5,
        price: 59.99,
        imageUrl:
            'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg');

    // Create New Improved Luxor !
    final HotelEntity newLuxor = luxorEntity.merge(
        title: 'Luxor Improved',
        city: 'New Las Vegas',
        stateCode: 'OH', //New Las Vegas is in Ohio.
        starRating: 5.0,
        isLiked: true,
        price: 900.00,
        imageUrl:
            'https://tse1.mm.bing.net/th?id=OIP.vEYNTBmedb6h_h3lHr66XQHaFj');

    expect(newLuxor.title, 'Luxor Improved');
    expect(newLuxor.city, 'New Las Vegas');
    expect(newLuxor.stateCode, 'OH');
    expect(newLuxor.starRating, 5.0);
    expect(newLuxor.isLiked, true);
    expect(newLuxor.price, 900.00);
    expect(newLuxor.imageUrl,
        'https://tse1.mm.bing.net/th?id=OIP.vEYNTBmedb6h_h3lHr66XQHaFj');

    // create new entity merge & compare one last time.
    final HotelEntity finalLuxor = newLuxor.merge();

    expect(newLuxor.title, finalLuxor.title);
    expect(newLuxor.city, finalLuxor.city);
    expect(newLuxor.stateCode, finalLuxor.stateCode);
    expect(newLuxor.starRating, finalLuxor.starRating);
    expect(newLuxor.isLiked, finalLuxor.isLiked);
    expect(newLuxor.price, finalLuxor.price);
    expect(newLuxor.imageUrl, finalLuxor.imageUrl);
  });
}
