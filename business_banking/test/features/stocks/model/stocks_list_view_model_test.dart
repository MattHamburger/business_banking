import 'package:business_banking/features/stocks_detail/model/stocks_list_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

List<Map<String, dynamic>> stocksList = [
    {
      "company": "Amazon.com",
      "symbol": "AMZN",
      "at_close": 89.38,
      "shares": 100,
      "value": 8938.0
    }
  ];

  test('StocksListViewModel initializes', () {
    final viewModel = StocksListViewModel(stocksList: stocksList);
    expect(viewModel.stocksList, stocksList);
  });

  test('StocksListViewModel has correct properties', () {
    StocksListViewModel viewModel = StocksListViewModel(stocksList: stocksList);
    expect(viewModel.props, [
      [
        {
          "company": "Amazon.com",
          "symbol": "AMZN",
          "at_close": 89.38,
          "shares": 100,
          "value": 8938.0
        }
      ]
    ]);
  });
}