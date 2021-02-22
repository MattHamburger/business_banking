import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_usecase.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testing UseCase', () async {
    CheckDepositViewModel model;
    CheckDepositUseCase useCase = CheckDepositUseCase((viewModel) {
      model = viewModel;
    });

    // testing create method
    await useCase.create();
    DateTime now = DateTime.now();
    final defaultDate = new DateTime(now.year, now.month, now.day);

    // testing updateFromAccount method
    await useCase.updateToAccount('4444444444');
    expect(
        model,
        CheckDepositViewModel(
            toAccounts: ['4444444444', '5555555555', '6666666666'],
            date: defaultDate));

    // testing updateToAccount method
    useCase.updateToAccount('5555555555');
    expect(
        model,
        CheckDepositViewModel(
            toAccounts: ['4444444444', '5555555555', '6666666666'],
            toAccount: '4444444444',
            date: defaultDate));

    // testing updateAmount method
    // valid amount
    useCase.updateAmount('53.24');
    expect(
        model,
        CheckDepositViewModel(
            toAccounts: ['4444444444', '5555555555', '6666666666'],
            toAccount: '5555555555',
            amount: '53.24',
            date: defaultDate));

    // testing updateDate method
    DateTime date = DateTime(2021);
    useCase.updateDate(date);
    CheckDepositViewModel modelForComparing = CheckDepositViewModel(
        toAccounts: ['4444444444', '5555555555', '6666666666'],
        toAccount: '5555555555',
        amount: '53.24',
        date: date);
    expect(model, modelForComparing);
    expect(model.date, modelForComparing.date);

    // testing submitTransfer method
    await useCase.submitDeposit();
    expect(model.id, '1122334455');
  });
}
