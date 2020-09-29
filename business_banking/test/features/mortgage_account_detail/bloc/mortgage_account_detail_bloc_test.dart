import 'package:business_banking/features/mortgage_account_details/api/mortgage_account_detail_service.dart';
import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_bloc.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mortgage_account_detail_mock_bloc.dart';

void main() {
  test('MortgageAccountDetailBloc gets view model, mock', () {
    final bloc = MortgageAccountDetailMockBloc();
    bloc.mortgageAccountDetailViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<MortgageAccountDetailViewModel>());
      expect(model.name, 'Employee Mortgage');
      expect(model.lastFour.toString(), '7635');
      expect(model.balance.toString(), '8935.9');
      expect(model.accountType, 'Mortgage');
      expect(model.applicationNumber.toString(), '879076567');
      expect(model.beginningBalance.toString(), '9390.43');
      expect(model.pendingTransactions.toString(), '-898.89');
      expect(model.depositHolds.toStringAsFixed(2), '0.00');
    }));
  });

  test('MortgageAccountDetailBloc gets view model', () {
    final bloc = MortgageAccountDetailBloc(accountDetailService: MortgageAccountDetailService());
    expect(bloc.mortgageAccountDetailViewModelPipe, isA<Pipe<MortgageAccountDetailViewModel>>());
    bloc.dispose();
  });
}
