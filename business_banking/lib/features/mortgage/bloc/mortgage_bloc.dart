import 'package:clean_framework/clean_framework.dart';
import 'mortgage_usecase.dart';
import '../model/mortgage_view_model.dart';
import '../api/mortgage_service.dart';
import '../model/mortgage_detail_view_model.dart';
import 'mortgage_detail_usecase.dart';

class MortgageBloc extends Bloc {
  MortgageUseCase _useCase;
  MortgageDetailUseCase _detailUseCase;

  final mortgageViewModelPipe = Pipe<MortgageViewModel>();
  final mortgageDetailViewModelPipe = Pipe<MortgageDetailViewModel>();

  @override
  void dispose() {
    mortgageViewModelPipe.dispose();
    mortgageDetailViewModelPipe.dispose();
  }

  MortgageBloc({MortgageService mortgageService}) {
    _useCase =
        MortgageUseCase((viewModel) => mortgageViewModelPipe.send(viewModel));

    mortgageViewModelPipe.whenListenedDo(() => _useCase.create());

    _detailUseCase = MortgageDetailUseCase((viewModel) {
      return mortgageDetailViewModelPipe.send(viewModel);
    });

    mortgageDetailViewModelPipe.whenListenedDo(() => _detailUseCase.create());
  }
}
