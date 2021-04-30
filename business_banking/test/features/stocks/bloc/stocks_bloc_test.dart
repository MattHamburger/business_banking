import 'package:business_banking/features/stocks_detail/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_list_view_model.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_portfolio_view_model.dart';
// import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  final bloc = StocksBloc();
  List<Map<String, dynamic>> stocksList = [
    {
      "company": "Amazon.com",
      "symbol": "AMZN",
      "at_close": 89.38,
      "shares": 100,
      "value": 8938.0
    },
    {
      "company": "Disney",
      "symbol": "DIS",
      "at_close": 40.65,
      "shares": 100,
      "value": 4065.00
    },
    {
      "company": "PepsiCo",
      "symbol": "PEP",
      "at_close": 38.02,
      "shares": 100,
      "value": 3802.00
    },
    {
      "company": "Apple",
      "symbol": "AAPL",
      "at_close": 134.22,
      "shares": 100,
      "value": 13422.00
    },
    {
      "company": "Home Depot",
      "symbol": "HD",
      "at_close": 323.60,
      "shares": 100,
      "value": 32360.00
    },
    {
      "company": "Nike",
      "symbol": "NIKE",
      "at_close": 130.19,
      "shares": 100,
      "value": 13019.00
    }
  ];
  test('StocksBloc get correct StocksPortfolioViewModel', () {
    bloc.stocksPortfolioViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<StocksPortfolioViewModel>());
      expect(model.stocksList, stocksList);
    }));
  });

  test('StocksBloc gets correct StocksListViewModel', () {
    bloc.stocksListViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<StocksListViewModel>());
      expect(model.stocksList, stocksList);
    }));
  });
}
