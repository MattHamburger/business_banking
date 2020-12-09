import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class RulesResponseModel extends Equatable implements JsonResponseModel {
  final int memoLimit;
  final double paymentMin;
  final double paymentMax;

  RulesResponseModel.fromJson(Map<String, dynamic> json)
      : memoLimit = json["memo_limit"] ?? 0,
        paymentMin = json["payment_min"] ?? 0,
        paymentMax = json["payment_max"] ?? 0;

  @override
  List<Object> get props => [
        memoLimit,
        paymentMin,
        paymentMax,
      ];
}
