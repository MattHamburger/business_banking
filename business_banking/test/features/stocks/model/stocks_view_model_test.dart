import 'package:business_banking/features/stocks_detail/model/stocks_portfolio_view_model.dart';
import 'package:test/test.dart';

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
  test('StocksViewModel initializes ', () async {
    final viewModel = StocksPortfolioViewModel(stocksList: stocksList);

    expect(viewModel.stocksList, stocksList);
  });

  test('StocksViewModel has correct properties', () {
    StocksPortfolioViewModel viewModel = StocksPortfolioViewModel(stocksList: stocksList);
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

  test('StocksViewModel totalValue is correct', () async {
    List<Map<String, dynamic>> stocks = [
      {
        "company": "Amazon.com",
        "symbol": "AMZN",
        "at_close": 89.38,
        "shares": 100,
        "value": 1000.0
      },
      {
        "company": "Apple",
        "symbol": "AAPL",
        "at_close": 134.22,
        "shares": 100,
        "value": 1000.00
      }
    ];
    StocksPortfolioViewModel viewModel = StocksPortfolioViewModel(stocksList: stocks);
    expect(viewModel.totalValue, 2000.0);
  });
}
