import 'package:clean_framework/clean_framework_defaults.dart';

class PromoHubCardResponseModel extends JsonResponseModel {
  final String icon;
  final String income;
  final String phone;

  PromoHubCardResponseModel(
      this.icon,
      this.income,
      this.phone
      );

  PromoHubCardResponseModel.fromJson(Map<String, dynamic> json)
      : income = json['income'] ?? '',
        phone = json['phone'] ?? '',
        icon = json['icon'] ?? '';

  @override
  List<Object?> get props => [
    this.income,
    this.phone,
    this.icon,
  ];
}
