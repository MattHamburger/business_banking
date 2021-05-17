import 'package:business_banking/features/stocks/bloc/stocks_usecase.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class StocksBloc extends Bloc {

  StocksUseCase? _stocksUseCase;
  final stocksViewModelPipe = Pipe<StocksViewModel>();

  @override
  void dispose() {
    stocksViewModelPipe.dispose();
  }

  StocksBloc({
    StocksUseCase? stocksUseCase
  }){
    _stocksUseCase = stocksUseCase ??
        StocksUseCase((viewModel) =>
            stocksViewModelPipe.send(viewModel as StocksViewModel));
    stocksViewModelPipe.whenListenedDo(_stocksUseCase!.create);
  }

}