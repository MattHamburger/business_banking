// @dart=2.9

import 'package:business_banking/features/hotels/model/hotel_entity.dart';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:business_banking/locator.dart';
import 'package:business_banking/features/hotels/bloc/hotels_usecase.dart';
import 'package:business_banking/features/hotels/model/hotels_list_entity.dart';
import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';

void main() {
  //var _viewModel;

  test('HotlesUseCase create', () async {
    final useCase = HotelsUseCase((viewModel) {
      //
      expect(viewModel, isA<HotelsListViewModel>());
      return true;
    });

    await useCase.create();
  });

  test('HotelsUseCase HotelsEntity create', () async {
    //
    final entity = HotelsListEntity();

    ExampleLocator()
        .repository
        .create<HotelsListEntity>(entity, (_) {}, deleteIfExists: true);

    final useCase = HotelsUseCase((viewModel) {
      //
      final _scope =
          ExampleLocator().repository.containsScope<HotelsListEntity>();

      final findEntity =
          ExampleLocator().repository.get<HotelsListEntity>(_scope);

      expect(findEntity, isA<HotelsListEntity>());
      expect(viewModel, isA<HotelsListViewModel>());

      return true;
    });

    await useCase.create();
  });

  test('HotelsUseCase HotelsEntity Merge', () async {
    //
    final HotelEntity hEntity = HotelEntity(
      title: 'Luxor',
      city: 'Las Vegas',
      stateCode: 'NV',
      isLiked: true,
      starRating: 2.5,
      price: 59.99,
      imageUrl: '',
    );

    final HotelsListEntity hle = HotelsListEntity(allHotels: [hEntity]);

    ExampleLocator()
        .repository
        .create<HotelsListEntity>(hle, (_) {}, deleteIfExists: true);

    final useCase = HotelsUseCase((viewModel) {
      expect(viewModel, isA<HotelsListViewModel>());
      return true;
    });

    await useCase.create();

    final HotelViewModel hotelVM = HotelViewModel(
      title: 'Luxor',
      city: 'Las Vegas',
      stateCode: 'NV',
      isLiked: true, // Currently true, this will trigger to false.
      starRating: 2.5,
      price: 59.99,
      imageUrl: '',
    );

    // Switch like from true to false.
    final HotelsListEntity newHotelsEntity = useCase.switchLike(hotelVM);

    expect(newHotelsEntity, isA<HotelsListEntity>());
    expect(newHotelsEntity.allHotels, isA<List<HotelEntity>>());

    // Make sure isLiked is now false.
    final HotelEntity luxorEntity = newHotelsEntity.allHotels.first;
    expect(luxorEntity.isLiked, false);
  });
}
