import 'package:flutter_test/flutter_test.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_entity.dart';

void main() {
  StocksEntity entity = StocksEntity(stocks: [
    {"name": "test"}
  ]);

  test('StockEntity properties', () {
    expect(entity.stocks, [
      {"name": "test"}
    ]);

    expect(entity.toString(), 'StocksEntity([], [{name: test}])');
  });

  test('StocksEntity merge with errors = null', () {
    entity.merge(errors: null);
    expect(entity.stocks, [
      {"name": "test"}
    ]);
  });
}
