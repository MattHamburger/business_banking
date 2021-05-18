import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayCardResponseModel extends JsonResponseModel {
  final int billsDue;

  BillPayCardResponseModel.fromJson(Map<String, dynamic> json)
      : billsDue = json["bills"].length;

  @override
  List<Object> get props => [billsDue];
}