import 'package:clean_framework/clean_framework_defaults.dart';

class HotelsServiceResponseModel extends JsonResponseModel {
  final List<HotelInfo> allHotels;

  HotelsServiceResponseModel.fromJson(Map<String, dynamic> json)
      : allHotels = (json["hotels"] as List)
            .map((i) => new HotelInfo.fromJson(i))
            .toList();

  @override
  List<Object?> get props => [allHotels];
}

class HotelInfo {
  final String title;
  final String city;
  final String stateCode;
  final bool isLiked;
  final double starRating;
  final double price;
  final String imageUrl;

  HotelInfo(this.title, this.city, this.stateCode, this.isLiked,
      this.starRating, this.price, this.imageUrl);

  HotelInfo.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? '',
        city = json['city'] ?? '',
        stateCode = json['state_code'] ?? '',
        isLiked = (json['is_liked'] == "true") ? true : false,
        starRating = json['star_rating'] ?? 0,
        price = json['price'] ?? 00.00,
        imageUrl = json['image_url'] ?? "";
}
