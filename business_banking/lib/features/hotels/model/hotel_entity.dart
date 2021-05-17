import 'package:clean_framework/clean_framework.dart';

class HotelEntity extends Entity {
  final String title;
  final String city;
  final String stateCode;
  final bool isLiked;
  final double starRating;
  final double price;
  final String imageUrl;

  HotelEntity(
      {List<EntityFailure> errors = const [],
      String? title,
      String? city,
      String? stateCode,
      bool? isLiked,
      double? starRating,
      double? price,
      String? imageUrl})
      : title = title ?? '',
        city = city ?? '',
        stateCode = stateCode ?? '',
        isLiked = isLiked ?? false,
        starRating = starRating ?? 0.0,
        price = price ?? 0.00,
        imageUrl = imageUrl ?? '',
        super(errors: errors);

  @override
  List<Object> get props =>
      [errors, title, city, stateCode, isLiked, starRating, price, imageUrl];

  @override
  HotelEntity merge(
      {errors,
      String? title,
      String? city,
      String? stateCode,
      bool? isLiked,
      double? starRating,
      double? price,
      String? imageUrl}) {
    return HotelEntity(
        errors: errors ?? this.errors,
        title: title ?? this.title,
        city: city ?? this.city,
        stateCode: stateCode ?? this.stateCode,
        isLiked: isLiked ?? this.isLiked,
        starRating: starRating ?? this.starRating,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl);
  }
}
