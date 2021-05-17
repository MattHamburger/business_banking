import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('StockPrice initialize', () async {
    final viewModel = StockPrice(id: "1", companyName: "Apple", last: 127.45, high: 127.89, low: 125.85, change: 2.48, volume: "81.92M");
    expect(viewModel.id, '1');
    expect(viewModel.companyName, 'Apple');

    final viewModel2 = StockPrice.fromJson({
      "id": "3",
      "companyName": "Walt Disney",
      "last": 173.70,
      "high": 174.91,
      "low": 168.78,
      "change": -4.64,
      "volume": "33.15M"
    });
    expect(viewModel2.id, '3');
    expect(viewModel2.companyName, 'Walt Disney');
  });


  test('StocksViewModel initialize', () async {
    List<StockPrice> stockPrices = List.empty(growable: true);
    stockPrices.add(StockPrice(id: "1", companyName: "Apple", last: 127.45, high: 127.89, low: 125.85, change: 2.48, volume: "81.92M"));
    stockPrices.add(StockPrice(id: "2", companyName: "Tesla", last: 589.74, high: 592.87, low: 570.46, change: 18.05, volume: "33.37M"));
    stockPrices.add(StockPrice(id: "3", companyName: "Walt Disney", last: 173.70, high: 174.91, low: 168.78, change: -4.64, volume: "33.15M"));

    final viewModel = StocksViewModel(
      stockPrices: stockPrices, serviceResponseStatus: ServiceResponseStatus.succeed
    );
    expect(viewModel.stockPrices, stockPrices);
    expect(viewModel.props, [
      viewModel.stockPrices, viewModel.serviceResponseStatus
    ]);
  });

}