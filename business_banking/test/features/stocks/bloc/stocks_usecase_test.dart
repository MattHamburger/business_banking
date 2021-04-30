import 'package:business_banking/features/stocks_detail/bloc/stocks_usecase.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_portfolio_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:test/test.dart';

void main() {
  test('StocksUseCase initializes and calls create', () {
    final usecase = StocksUseCase((viewModel) {
      expect(viewModel, isA<StocksPortfolioViewModel>());
      throw Error();
    });
    usecase.create();
  });
}
