import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksViewModel extends ViewModel {
  final List<StockPrice> stockPrices;
  final serviceResponseStatus;

  StocksViewModel({
    required this.stockPrices,
    this.serviceResponseStatus = ServiceResponseStatus.unknown
  });

  @override
  List<Object?> get props => [
    stockPrices,
    serviceResponseStatus
  ];
}

class StockPrice {
  final String id;
  final String companyName;
  final double last;
  final double high;
  final double low;
  final double change;
  final String volume;

  StockPrice({required this.id, required this.companyName, required this.last, required this.high, required this.low, required this.change, required this.volume});

  StockPrice.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        companyName = json['companyName'] ?? '',
        last = json['last'] ?? 0.00,
        high = json['high'] ?? 0.00,
        low = json['low'] ?? 0.00,
        change = json['change'] ?? 0.00,
        volume = json['volume'] ?? '';
}