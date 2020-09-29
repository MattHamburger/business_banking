import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_service_adapter.dart';
import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_usecse.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_entity.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageAccountsUseCase testCases ', () {
    final mortgageAccountsViewModelPipe = Pipe<MortgageAccountsViewModel>();
    final useCase = MortgageAccountsUseCase((viewModel) => mortgageAccountsViewModelPipe.send(viewModel), serviceAdapter: MortgageAccountsServiceAdapter());
    mortgageAccountsViewModelPipe.onListen(() => useCase.create());
    expect(useCase, isA<MortgageAccountsUseCase>());
    useCase.create();
    expect(useCase.buildViewModel(MortgageAccountsEntity(
        name: 'Employee Mortgage',
        lastFour: '7635',
        balance: 7898.54
    )), isA<MortgageAccountsViewModel>());

  });
}