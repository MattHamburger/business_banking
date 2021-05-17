import 'package:clean_framework/clean_framework.dart';

class HotelViewModel extends ViewModel {
  final String title;
  final String city;
  final String stateCode;
  final bool isLiked;
  final double starRating;
  final double price;
  final String imageUrl;

  HotelViewModel({
    required this.title,
    required this.city,
    required this.stateCode,
    required this.isLiked,
    required this.starRating,
    required this.price,
    required this.imageUrl,
  });

  @override
  List<Object> get props =>
      [title, city, stateCode, isLiked, starRating, price, imageUrl];
}
