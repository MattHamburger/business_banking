import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_usecase.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_entity.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageAccountDetailUseCase testCases ', () {
    final mortgageAccountDetailViewModelPipe = Pipe<MortgageAccountDetailViewModel>();
    final useCase = MortgageAccountDetailUseCase((viewModel) => mortgageAccountDetailViewModelPipe.send(viewModel));
    mortgageAccountDetailViewModelPipe.onListen(() => useCase.create());
    expect(useCase, isA<MortgageAccountDetailUseCase>());
    useCase.create();
    final viewModel = MortgageAccountDetailViewModel(name: 'Mortgage',
        lastFour: '7635',
        accountType: 'Mortgage',
        applicationNumber: 876395735,
        balance: 6735.54,
        beginningBalance: 9243.43,
        pendingTransactions: -228.89,
        depositHolds: 0.00);
    expect(useCase.buildViewModel(MortgageAccountDetailEntity(
        name: 'Mortgage',
        lastFour: '7635',
        accountType: 'Mortgage',
        applicationNumber: 876395735,
        balance: 6735.54,
        beginningBalance: 9243.43,
        pendingTransactions: -228.89,
        depositHolds: 0.00
    )), isA<MortgageAccountDetailViewModel>());
    expect(viewModel, isA<MortgageAccountDetailViewModel>());
  });
}