import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:clean_framework/clean_framework.dart';

import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';
import 'package:business_banking/features/hotels/api/hotels_service_adapter.dart';
import 'package:business_banking/features/hotels/model/hotels_list_entity.dart';
import 'package:business_banking/features/hotels/model/hotel_entity.dart';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:business_banking/locator.dart';

class HotelsUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelListCallBack;

  RepositoryScope? _scope;
  HotelsUseCase(ViewModelCallback<ViewModel> viewModelCallBack)
      : _viewModelListCallBack = viewModelCallBack;

  Future<void> create() async {
    if (_scope == null) {
      _scope = ExampleLocator()
          .repository
          .create<HotelsListEntity>(HotelsListEntity(), _notifySubscribers);
    }

    HotelsListEntity entity = ExampleLocator().repository.get(_scope!);
    if (entity.allHotels.length == 0) {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope!, HotelsServiceAdapter());
    } else {
      _viewModelListCallBack(buildViewModels(entity));
    }
  }

  void _notifySubscribers(entity) {
    _viewModelListCallBack(buildViewModels(entity));
  }

  HotelsListEntity switchLike(HotelViewModel viewModel) {
    //
    HotelsListEntity mainEntity = ExampleLocator().repository.get(_scope!);
    List<HotelEntity> hotels = mainEntity.allHotels;

    List<HotelEntity> newList = [];
    for (int i = 0; i < hotels.length; i++) {
      //
      // Search entity by name. Create new entity.
      if (viewModel.title == hotels[i].title) {
        newList.add(hotels[i].merge(isLiked: !viewModel.isLiked));
      } else {
        newList.add(hotels[i]);
      }
    }

    final newMainEntity = HotelsListEntity(allHotels: newList);
    ExampleLocator().repository.update(_scope!, newMainEntity);
    _viewModelListCallBack(buildViewModels(newMainEntity));

    return newMainEntity;
  }

  HotelsListViewModel buildViewModels(HotelsListEntity entities) {
    List<HotelViewModel> hotelList =
        entities.allHotels.map((i) => this.buildViewModel(i)).toList();

    return HotelsListViewModel(hotels: hotelList);
  }

  HotelViewModel buildViewModel(HotelEntity entity) {
    return HotelViewModel(
        title: entity.title,
        city: entity.city,
        stateCode: entity.stateCode,
        isLiked: entity.isLiked,
        starRating: entity.starRating,
        price: entity.price,
        imageUrl: entity.imageUrl);
  }
}
