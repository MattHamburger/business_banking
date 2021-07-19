import 'package:clean_framework/clean_framework_defaults.dart';

class OffersServiceResponseModel extends JsonResponseModel {
  final List<String> offers;

  OffersServiceResponseModel({required this.offers});

  OffersServiceResponseModel.fromJson(Map<String, dynamic> json)
      : offers = json['offers']?.cast<String>() ?? <String>[];

  @override
  List<Object?> get props => [offers];
}
