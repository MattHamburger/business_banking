// package
import 'package:clean_framework/clean_framework.dart';
// iinternal
import '../api/investment_service.dart';
import '../model/investment_view_model.dart';
import 'investment_usecase.dart';

class InvestmentBloc extends Bloc {
  InvestmentUseCase _useCase;

  final investmentViewModelPipe = Pipe<InvestmentViewModel>();

  @override
  void dispose() {
    investmentViewModelPipe.dispose();
  }

  InvestmentBloc({InvestmentService investmentService}) {
    _useCase = InvestmentUseCase(
        (viewModel) => investmentViewModelPipe.send(viewModel));
    investmentViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
