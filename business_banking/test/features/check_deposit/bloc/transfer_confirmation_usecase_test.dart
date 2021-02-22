import 'package:business_banking/features/transfer_funds/bloc/transfer_confirmation_usecase.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_confirmation_view_model.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testing ConfirmationUseCase', () async {

    TransferConfirmationViewModel model;
    DateTime date = DateTime.now();
    TransferFundsEntity entity = TransferFundsEntity(
        fromAccount: '1111111111',
        toAccount: '4444444444',
        amount: '25.6',
        date: date,
        fromAccounts: ['1111111111', '2222222222', '3333333333'],
        toAccounts: ['4444444444', '5555555555', '6666666666'],
        id: '123456789');

    ExampleLocator().repository.create<TransferFundsEntity>(entity, null);

    TransferConfirmationUseCase useCase =
        TransferConfirmationUseCase((viewModel) {
      model = viewModel;
    });

    // testing create method
    useCase.create();
    expect(
        model,
        TransferConfirmationViewModel(
            fromAccount: '1111111111',
            toAccount: '4444444444',
            amount: '25.6',
            date: date,
            id: '123456789'));

    useCase.clearTransferData();
    final _scope = ExampleLocator().repository.containsScope<TransferFundsEntity>();
    var clearEntity = ExampleLocator().repository.get<TransferFundsEntity>(_scope);
    expect(clearEntity, TransferFundsEntity(fromAccounts: entity.fromAccounts));
  });
}
