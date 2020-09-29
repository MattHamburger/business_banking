import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_view_model.dart';
import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_usecse.dart';

import 'mortgage_accounts_service_adapter.dart';

class MortgageAccountsBloc extends Bloc {
  MortgageAccountsUseCase _useCase;

  final mortgageAccountsViewModelPipe = Pipe<MortgageAccountsViewModel>();

  @override
  void dispose() {
    mortgageAccountsViewModelPipe.dispose();
  }

  MortgageAccountsBloc({MortgageAccountsServiceAdapter serviceAdapter}) {
    _useCase = MortgageAccountsUseCase((viewModel) => mortgageAccountsViewModelPipe.send(viewModel), serviceAdapter: serviceAdapter);
    mortgageAccountsViewModelPipe.onListen(() => _useCase.create());
  }
}