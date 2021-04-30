import 'package:business_banking/features/stocks_detail/api/stocks_service.dart';
import 'package:business_banking/features/stocks_detail/bloc/stocks_list_usecase.dart';
import 'package:business_banking/features/stocks_detail/bloc/stocks_usecase.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_list_view_model.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_portfolio_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksBloc extends Bloc {
  late StocksUseCase _useCase;
  late StocksListUseCase _stocksListUseCase;
  final stocksPortfolioViewModelPipe = Pipe<StocksPortfolioViewModel>();
  final stocksListViewModelPipe = Pipe<StocksListViewModel>();
  final deleteStockPipe = Pipe<int>();

  @override
  void dispose() {
    stocksPortfolioViewModelPipe.dispose();
    stocksListViewModelPipe.dispose();
    deleteStockPipe.dispose();
  }

  StocksBloc({StocksService? stocksService}) {
    _useCase = StocksUseCase((viewModel) => stocksPortfolioViewModelPipe
        .send(viewModel as StocksPortfolioViewModel));
    stocksPortfolioViewModelPipe.whenListenedDo(() => _useCase.create());

    _stocksListUseCase = StocksListUseCase((viewModel) =>
        stocksListViewModelPipe.send(viewModel as StocksListViewModel));
    stocksListViewModelPipe.whenListenedDo(() => _stocksListUseCase.create());

    deleteStockPipe.receive.listen(_deleteStock);
  }

  void _deleteStock(int index) {
    _stocksListUseCase.deleteStock(index);
  }
}
