import 'dart:async';

import 'package:business_banking/features/transfer_funds/bloc/transfer_bloc.dart';
import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_entity.dart';
import 'package:business_banking/features/transfer_funds/model/transfer_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // This tests all the initial values when the Screen loads for the
  // first time
  test('testing transferFundsViewModelPipe', () async {
    final TransferFundsBloc bloc = new TransferFundsBloc();
    // Create TransferFundsViewModel Object with Data Values
    TransferFundsViewModel transferFundsViewModel = TransferFundsViewModel(
        fromAccounts: ['1111111111', '2222222222', '3333333333'],
        date: getLastMidnight());

    // testing transferFundsViewModelPipe
    bloc.transferFundsViewModelPipe.receive.listen(expectAsync1(
          (model) {
        // Are the values the same?
        expect(model, transferFundsViewModel);
      },
    ));
  }, timeout: Timeout(Duration(seconds: 300)));

  test('testing resetViewModelPipe', () async {
    TransferFundsEntity newTransferEntity = TransferFundsEntity(amount: '10.0', fromAccounts: ['1111111111', '2222222222', '3333333333']);
    ExampleLocator()
        .repository
        .create<TransferFundsEntity>(newTransferEntity, (_) {}, deleteIfExists: true);
    final TransferFundsBloc bloc = new TransferFundsBloc();
    TransferFundsViewModel emptyTransferFundsViewModel = TransferFundsViewModel(
        amount: '',
        date: getLastMidnight(),
        fromAccounts: ['1111111111', '2222222222', '3333333333'],
        dataStatus: DataStatus.invalid);

    bloc.confirmationViewModelPipe.receive.listen((event) { });
    bloc.resetViewModelPipe.launch();
    await Future.delayed(Duration(milliseconds: 200));
    bloc.transferFundsViewModelPipe.receive.listen(expectAsync1(
            (model) {
            expect(model, emptyTransferFundsViewModel);
        }),);
    // testing transferFundsViewModelPipe

  }, timeout: Timeout(Duration(seconds: 3)));
  // This tests the from account value sent through the pipe
  test('testing fromAccountPipe', () async {
    resetEntityInRepository();
    final TransferFundsBloc bloc = new TransferFundsBloc();
    // Setup a Listener to receive specific pipe data
    createFromAccountPipeListener(bloc);

    // Providing the From Account Value and send through the pipe
    // to receiver.
    bloc.fromAccountPipe.send('1111111111');
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing toAccountPipe', () async {
    resetEntityInRepository();
    final TransferFundsBloc bloc = new TransferFundsBloc();
    /// Setup a Listener to receive specific pipe data
    createToAccountPipeListener(bloc);

    // Providing the To Account Value and send through the pipe
    // to receiver.
    bloc.toAccountPipe.send('5555555555');
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing AmountPipe', () async {
    resetEntityInRepository();
    final TransferFundsBloc bloc = new TransferFundsBloc();
    // Setup a Listener to receive specific pipe data
    createAmountPipeListener(bloc);

    // Providing the Amount Value and send through the pipe
    // to receiver.
    bloc.amountPipe.send('25.4');
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing DatePipe', () async {
    resetEntityInRepository();
    final TransferFundsBloc bloc = new TransferFundsBloc();
    // Setup a Listener to receive specific pipe data
    createAmountPipeListener(bloc);

    // Providing the Date Value and send through the pipe
    // to receiver.
    bloc.datePipe.send(DateTime(2020));
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing SubmitPipe', () async {
    resetEntityInRepository();
    final TransferFundsBloc bloc = new TransferFundsBloc();
    // Setup a Listener to receive specific pipe data
    createSubmitPipeListener(bloc);

    // Providing the Date Value and send through the pipe
    // to receiver.
    bloc.submitPipe.launch();
  }, timeout: Timeout(Duration(seconds: 3)));
}

void createFromAccountPipeListener(TransferFundsBloc bloc) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.fromAccount, '1111111111');
    }
  }));
}

void createToAccountPipeListener(TransferFundsBloc bloc) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.toAccount, '5555555555');
    }
  }));
}

void createAmountPipeListener(TransferFundsBloc bloc) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.amount, 25.4);
    }
  }));
}

void createDatePipeListener(TransferFundsBloc bloc) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.date, DateTime(2020));
    }
  }));
}

void createSubmitPipeListener(TransferFundsBloc bloc) {
  // Create Pipe Listener
  bloc.transferFundsViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.fromAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<TransferFundsViewModel>());
      expect(model.id, '123456789');
    }
  }));
}

void resetEntityInRepository() {
  final TransferFundsEntity entity = TransferFundsEntity();
  ExampleLocator()
      .repository
      .create<TransferFundsEntity>(entity, (_){}, deleteIfExists: true);
}

DateTime getLastMidnight() {
  final now = DateTime.now();
  final lastMidnight = new DateTime(now.year, now.month, now.day);
  return lastMidnight;
}

