import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_view_model.dart';
import 'package:business_banking/features/mortgage_account_details/api/mortgage_account_detail_service.dart';
import 'mortgage_account_detail_usecase.dart';

class MortgageAccountDetailBloc extends Bloc {
  MortgageAccountDetailUseCase _useCase;

  final mortgageAccountDetailViewModelPipe = Pipe<MortgageAccountDetailViewModel>();

  @override
  void dispose() {
    mortgageAccountDetailViewModelPipe.dispose();
  }

  MortgageAccountDetailBloc({MortgageAccountDetailService accountDetailService}) {
    _useCase = MortgageAccountDetailUseCase((viewModel) => mortgageAccountDetailViewModelPipe.send(viewModel));
    mortgageAccountDetailViewModelPipe.onListen(() => _useCase.create());
  }
}