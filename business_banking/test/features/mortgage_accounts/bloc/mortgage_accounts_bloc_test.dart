import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_bloc.dart';
import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_usecse.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_entity.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import '../api/mortgage_accounts_mock_service_adapter.dart';
import 'mortgage_accounts_bloc_mock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageAccountsBloc gets view model, mock', () {
    final bloc = MortgageAccountsBlocMock();

    bloc.mortgageAccountsViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<MortgageAccountsViewModel>());
      expect(model.name, 'Employee Mortgage');
      expect(model.lastFour.toString(), '7635');
      expect(model.balance.toString(), '7898.54');
    }));
  });

  test('MortgageAccountsBlocUseCase gets view model, mock', () {

    final bloc = MortgageAccountsBloc(serviceAdapter: MortgageAccountsMockServiceAdapter());
    expect(bloc, isA<MortgageAccountsBloc>());
    expect(bloc.mortgageAccountsViewModelPipe, isA<Pipe<MortgageAccountsViewModel>>());
    bloc.dispose();
  });

}