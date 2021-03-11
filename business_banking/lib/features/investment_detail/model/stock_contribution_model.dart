// package
import 'package:clean_framework/clean_framework_defaults.dart';

class StockContributionModel extends JsonResponseModel {
  final String symbol;
  final double dayGainValue;
  final double dayGainPercent;
  final double price;
  final double marketValue;
  final int count;

  StockContributionModel.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'] ?? '',
        dayGainValue = json['dayGainValue'] ?? 0.00,
        dayGainPercent = json['dayGainPercent'] ?? 0.00,
        price = json['price'] ?? 0.00,
        count = json['count'] ?? 0,
        marketValue = json['marketValue'] ?? 0.00;

  @override
  List<Object> get props =>
      [symbol, dayGainValue, dayGainPercent, price, count, marketValue];
}
