import 'package:clean_framework/clean_framework_defaults.dart';

class PromoHubCardRequestModel implements JsonRequestModel {

  final String income;
  final String phone;

  PromoHubCardRequestModel({required this.income, required this.phone});

  @override
  Map<String, dynamic> toJson() {
    return {
      'income': income,
      'phone': phone
    };
  }
}
