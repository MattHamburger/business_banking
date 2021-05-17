import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hotels/model/hotel_entity.dart';

class HotelsListEntity extends Entity {
  final List<HotelEntity> allHotels;

  HotelsListEntity(
      {List<EntityFailure> errors = const [], List<HotelEntity>? allHotels})
      : allHotels = allHotels ?? [],
        super(errors: errors);

  @override
  List<Object> get props => [errors, allHotels];

  @override
  HotelsListEntity merge({errors, List<HotelEntity>? allHotels}) {
    return HotelsListEntity(
        errors: errors ?? this.errors, allHotels: allHotels ?? this.allHotels);
  }
}
