import 'package:business_banking/features/hotels/model/hotel_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/hotels/model/hotels_list_entity.dart';
import 'package:business_banking/features/hotels/api/hotels_service.dart';
import 'package:business_banking/features/hotels/api/hotels_service_response_model.dart';

class HotelsServiceAdapter extends ServiceAdapter<HotelsListEntity,
    JsonRequestModel, HotelsServiceResponseModel, HotelsService> {
  HotelsServiceAdapter() : super(HotelsService());

  @override
  HotelsListEntity createEntity(HotelsListEntity? initialEntity,
      HotelsServiceResponseModel responseModel) {
    //
    List<HotelEntity> allHotels = [];
    HotelEntity he;
    for (int i = 0; i < responseModel.allHotels.length; i++) {
      he = _buildEntity(responseModel.allHotels[i]);
      allHotels.add(he);
    }

    return HotelsListEntity(allHotels: allHotels);
  }

  HotelEntity _buildEntity(HotelInfo info) {
    return HotelEntity(
        title: info.title,
        city: info.city,
        stateCode: info.stateCode,
        isLiked: info.isLiked,
        starRating: info.starRating,
        price: info.price,
        imageUrl: info.imageUrl);
  }
}
