// package
import 'package:clean_framework/clean_framework.dart';
// internal
import '../api/investment_detail_service.dart';
import 'investment_detail_usecase.dart';
import '../model/investment_detail_view_model.dart';

class InvestmentDetailBloc extends Bloc {
  InvestmentDetailUseCase _useCase;

  final investmentDetailViewModelPipe = Pipe<InvestmentDetailViewModel>();

  @override
  void dispose() {
    investmentDetailViewModelPipe.dispose();
  }

  InvestmentDetailBloc({InvestmentDetailService investmentDetailService}) {
    _useCase = InvestmentDetailUseCase(
        (viewModel) => investmentDetailViewModelPipe.send(viewModel));
    investmentDetailViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
