import 'package:clean_framework/clean_framework_defaults.dart';

class StocksServiceResponseModel extends JsonResponseModel {
  final List<Map<String, dynamic>> stocks;

  StocksServiceResponseModel.fromJson(Map<String, dynamic> json)
      : stocks = List.from(json["stocks"]);

  @override
  List<Object> get props => [stocks];
}
