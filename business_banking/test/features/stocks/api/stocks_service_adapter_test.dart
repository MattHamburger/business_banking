import 'package:business_banking/features/stocks_detail/api/stocks_service_response_model.dart';
import 'package:business_banking/features/stocks_detail/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Correct Entity is created by service adapter', () {
    final entity = StocksServiceAdapter().createEntity(
        StocksEntity(),
        StocksServiceResponseModel.fromJson({
          'stocks': [
            {'name': 'test', 'price': 100, 'shares': 100}
          ]
        }));

    expect(
        entity,
        StocksEntity(stocks: [
          {'name': 'test', 'price': 100, 'shares': 100}
        ]));
  });
}
