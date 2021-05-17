import 'package:business_banking/features/stocks/api/stocks_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('StocksServiceResponseModel initialize', () async {

    final viewModel = StocksServiceResponseModel.fromJson({
      'transactions': [
        {
          "id": "1",
          "companyName": "Apple",
          "last": 127.45,
          "high": 127.89,
          "low": 125.85,
          "change": 2.48,
          "volume": "81.92M"
        }]
    });

    expect(viewModel.stockPrices.length, 1);
    expect(viewModel.stockPrices[0].id, '1');
    expect(viewModel.props, [
      viewModel.stockPrices.length]);
  });
}