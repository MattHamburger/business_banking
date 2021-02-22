import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_confirmation_usecase.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_entity.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_view_model.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testing ConfirmationUseCase', () async {

    TransferConfirmationViewModel model;
    DateTime date = DateTime.now();
    CheckDepositEntity entity = CheckDepositEntity(
        toAccount: '4444444444',
        amount: '25.6',
        date: date,
        toAccounts: ['4444444444', '5555555555', '6666666666'],
        id: '123456789');

    ExampleLocator().repository.create<CheckDepositEntity>(entity, null);

    CheckDepositConfirmationUseCase useCase =
    CheckDepositConfirmationUseCase((viewModel) {
      model = viewModel;
    });

    // testing create method
    useCase.create();
    expect(
        model,
        CheckDepositViewModel(
            toAccount: '4444444444',
            checkFrontImage: 'checkFrontImage',
            checkBackImage: 'checkBackImage',
            amount: '25.6',
            date: date,
            id: '123456789'));

    useCase.clearTransferData();
    final _scope = ExampleLocator().repository.containsScope<TransferFundsEntity>();
    var clearEntity = ExampleLocator().repository.get<TransferFundsEntity>(_scope);
    expect(clearEntity, CheckDepositEntity(toAccounts: entity.toAccounts));
  });
}
