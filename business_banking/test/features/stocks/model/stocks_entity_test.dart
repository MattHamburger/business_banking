import 'package:business_banking/features/stocks/model/stocks_entity.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('StocksEntity initialize with null values', () async {
    final entity = StocksEntity();
    expect(entity.stockPrices, List<StockPrice>.empty(growable: false));
    expect(entity.props, [
      entity.errors,
      entity.stockPrices,
    ]);
  });

  test('StocksEntity initialize with real values', () async {
    List<StockPrice> stockPrices = List.empty(growable: true);
    stockPrices.add(StockPrice(id: "1", companyName: "Apple", last: 127.45, high: 127.89, low: 125.85, change: 2.48, volume: "81.92M"));
    final entity = StocksEntity(
      stockPrices: stockPrices,
    );
    expect(entity.stockPrices, stockPrices);
    expect(entity.props, [
      entity.errors,
      entity.stockPrices,
    ]);
  });

  test('StockEntity merge', () async {
    List<StockPrice> stockPrices = List.empty(growable: true);
    stockPrices.add(StockPrice(id: "1", companyName: "Apple", last: 127.45, high: 127.89, low: 125.85, change: 2.48, volume: "81.92M"));
    stockPrices.add(StockPrice(id: "2", companyName: "Tesla", last: 589.74, high: 592.87, low: 570.46, change: 18.05, volume: "33.37M"));
    stockPrices.add(StockPrice(id: "3", companyName: "Walt Disney", last: 173.70, high: 174.91, low: 168.78, change: -4.64, volume: "33.15M"));

    final entity = StocksEntity(
      stockPrices: stockPrices,
    );

    List<StockPrice> stockPrices2 = List.empty(growable: true);
    stockPrices2.add(StockPrice(id: "5", companyName: "3M", last: 204.38, high: 205.12, low: 203.01, change: 0.97, volume: "1.48M"));

    final entity2 = entity.merge(
        stockPrices: stockPrices2
    ) as StocksEntity;

    expect(entity2.stockPrices, stockPrices2);

    final entity3 = entity2.merge() as StocksEntity;
    expect(entity2.stockPrices, entity3.stockPrices);
  });

}