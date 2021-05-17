import 'package:business_banking/features/stocks/api/stocks_response_model.dart';
import 'package:business_banking/features/stocks/api/stocks_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('StocksService creation', () async {
    final service = StocksService();
    expect(service.path, 'stock-prices');
  });

  test('StocksService parseResponse', () async {
    final json = {
      "stockPrices": [
        {
          "id": "1",
          "companyName": "Apple",
          "last": 127.45,
          "high": 127.89,
          "low": 125.85,
          "change": 2.48,
          "volume": "81.92M"
        }
      ]
    };
    final service = StocksService();
    StocksServiceResponseModel response = service.parseResponse(json);
    expect(response, isA<StocksServiceResponseModel>());
  });
}