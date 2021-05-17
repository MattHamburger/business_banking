import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class HotelsListViewModel extends ViewModel {
  final List<HotelViewModel> hotels;

  HotelsListViewModel({
    required this.hotels,
  });

  @override
  List<Object> get props => [hotels];
}
