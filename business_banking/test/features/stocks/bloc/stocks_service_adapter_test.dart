import 'package:business_banking/features/stocks/api/stocks_response_model.dart';
import 'package:business_banking/features/stocks/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks/model/stocks_entity.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Stocks Service Adapter Test', () {
    final tEntity = StocksEntity(
        stockPrices: List<StockPrice>.of({StockPrice(
            id: "1",
            companyName: "Apple",
            last: 127.45,
            high: 127.89,
            low: 125.85,
            change: 2.48,
            volume: "81.92M")}, growable: false));

    final tJsonResponse = {
      "stockPrices": [
      {
        "id": "1",
        "companyName": "Apple",
        "last": 127.45,
        "high": 127.89,
        "low": 125.85,
        "change": 2.48,
        "volume": "81.92M"
      }]
    };

    test('should received a json response and return Stocks entity',
            () async {
          final entity = StocksServiceAdapter().createEntity(
              StocksEntity(),
              StocksServiceResponseModel.fromJson(tJsonResponse));
          expect(entity, tEntity);
        });
  });
}