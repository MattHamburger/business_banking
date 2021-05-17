import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksEntity extends Entity {
  final List<StockPrice> stockPrices;

  StocksEntity({
    List<EntityFailure> errors = const [],
    List<StockPrice>? stockPrices,
  })  : stockPrices = stockPrices ?? List<StockPrice>.empty(growable: false),
        super(errors: errors);

  @override
  List<Object> get props => [
    errors,
    stockPrices,
  ];

  @override
  merge({
    errors,
    List<StockPrice>? stockPrices
  }) {
    return StocksEntity(
      errors: errors ?? this.errors,
      stockPrices: stockPrices ?? this.stockPrices,
    );
  }
}