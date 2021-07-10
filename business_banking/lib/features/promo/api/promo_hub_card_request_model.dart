import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class PromoRequestModel extends Equatable implements JsonRequestModel {

  final String income;
  final String phone;

  PromoRequestModel({required this.income, required this.phone});

  @override
  Map<String, dynamic> toJson() {
    return {
      'income': income,
      'phone': phone
    };
  }

  @override
  List<Object?> get props => [income, phone];
}
