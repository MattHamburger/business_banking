import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StocksServiceResponseModel extends JsonResponseModel {

  final List<StockPrice> stockPrices;

  StocksServiceResponseModel.fromJson(Map<String, dynamic> json)
      : stockPrices = stockPricesListFromJson(json['stockPrices']);

  @override
  List<Object> get props => [
    stockPrices.length
  ];

  static List<StockPrice> stockPricesListFromJson(List<dynamic>? json) {
    List<StockPrice> list = List<StockPrice>.empty(growable: true);
    if (json != null) {
      json.forEach((value) {
        list.add(StockPrice.fromJson(value));
      });
    }
    return list;
  }
}