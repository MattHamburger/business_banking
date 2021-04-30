import 'package:business_banking/features/stocks_detail/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_detail/model/stocks_portfolio_view_model.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'stocks_portfolio_screen.dart';

class StocksPortfolioPresenter
    extends Presenter<StocksBloc, StocksPortfolioViewModel, StockPortfolioScreen> {
  @override
  StockPortfolioScreen buildScreen(
      BuildContext context, StocksBloc bloc, StocksPortfolioViewModel viewModel) {
    return StockPortfolioScreen(
        viewModel: viewModel,
        navigateToStocksScreen: () {
          _navigateToStocksScreen(context);
        });
  }

  @override
  Stream<StocksPortfolioViewModel> getViewModelStream(StocksBloc bloc) {
    return bloc.stocksPortfolioViewModelPipe.receive;
  }

  void _navigateToStocksScreen(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.stocksListScreenRoute);
  }
}
