import 'dart:async';

import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_bloc.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_entity.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_view_model.dart';
import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:business_banking/locator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // This tests all the initial values when the Screen loads for the
  // first time
  test('testing checkDepositViewModelPipe', () async {
    final CheckDepositBloc bloc = new CheckDepositBloc();
    // Create TransferFundsViewModel Object with Data Values
    CheckDepositViewModel checkDepositViewModel = CheckDepositViewModel(
        toAccounts: ["4444444444", "5555555555", "6666666666"],
        date: getLastMidnight());

    // testing transferFundsViewModelPipe
    bloc.checkDepositViewModelPipe.receive.listen(expectAsync1(
          (model) {
        // Are the values the same?
        expect(model, checkDepositViewModel);
      },
    ));
  }, timeout: Timeout(Duration(seconds: 300)));

  test('testing resetViewModelPipe', () async {
    CheckDepositEntity checkDepositEntity = CheckDepositEntity(amount: '10.0', toAccounts: ["4444444444", "5555555555", "6666666666"]);
    ExampleLocator()
        .repository
        .create<CheckDepositEntity>(checkDepositEntity, (_) {}, deleteIfExists: true);
    final CheckDepositBloc bloc = new CheckDepositBloc();
    CheckDepositViewModel emptyTransferFundsViewModel = CheckDepositViewModel(
        amount: '',
        date: getLastMidnight(),
        toAccounts: ["4444444444", "5555555555", "6666666666"],
        dataStatus: DataStatus.invalid);

    bloc.confirmationViewModelPipe.receive.listen((event) { });
    bloc.resetViewModelPipe.launch();
    await Future.delayed(Duration(milliseconds: 200));
    bloc.checkDepositViewModelPipe.receive.listen(expectAsync1(
            (model) {
            expect(model, emptyTransferFundsViewModel);
        }),);
    // testing transferFundsViewModelPipe

  }, timeout: Timeout(Duration(seconds: 3)));


  test('testing toAccountPipe', () async {
    resetEntityInRepository();
    final CheckDepositBloc bloc = new CheckDepositBloc();
    /// Setup a Listener to receive specific pipe data
    createToAccountPipeListener(bloc);

    // Providing the To Account Value and send through the pipe
    // to receiver.
    bloc.toAccountPipe.send('5555555555');
  }, timeout: Timeout(Duration(seconds: 5)));

  test('testing AmountPipe', () async {
    resetEntityInRepository();
    final CheckDepositBloc bloc = new CheckDepositBloc();
    // Setup a Listener to receive specific pipe data
    createAmountPipeListener(bloc);

    // Providing the Amount Value and send through the pipe
    // to receiver.
    bloc.amountPipe.send('25.4');
  }, timeout: Timeout(Duration(seconds: 5)));

  test('testing DatePipe', () async {
    resetEntityInRepository();
    final CheckDepositBloc bloc = new CheckDepositBloc();
    // Setup a Listener to receive specific pipe data
    createAmountPipeListener(bloc);

    // Providing the Date Value and send through the pipe
    // to receiver.
    bloc.datePipe.send(DateTime(2021));
  }, timeout: Timeout(Duration(seconds: 3)));

  test('testing SubmitPipe', () async {
    resetEntityInRepository();
    final CheckDepositBloc bloc = new CheckDepositBloc();
    // Setup a Listener to receive specific pipe data
    createSubmitPipeListener(bloc);

    // Providing the Date Value and send through the pipe
    // to receiver.
    bloc.submitPipe.launch();
  }, timeout: Timeout(Duration(seconds: 3)));
}

void createFromAccountPipeListener(CheckDepositBloc bloc) {
  // Create Pipe Listener
  bloc.checkDepositViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.toAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<CheckDepositViewModel>());
      expect(model.toAccount, '5555555555');
    }
  }));
}

void createToAccountPipeListener(CheckDepositBloc bloc) {
  // Create Pipe Listener
  bloc.checkDepositViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.toAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<CheckDepositViewModel>());
      expect(model.toAccount, '5555555555');
    }
  }));
}

void createAmountPipeListener(CheckDepositBloc bloc) {
  // Create Pipe Listener
  bloc.checkDepositViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.toAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<CheckDepositViewModel>());
      expect(model.amount, 25.4);
    }
  }));
}

void createDatePipeListener(CheckDepositBloc bloc) {
  // Create Pipe Listener
  bloc.checkDepositViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.toAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<CheckDepositViewModel>());
      expect(model.date, DateTime(2021));
    }
  }));
}

void createSubmitPipeListener(CheckDepositBloc bloc) {
  // Create Pipe Listener
  bloc.checkDepositViewModelPipe.receive.listen(expectAsync1((model) {
    if (model.toAccount != null) {
      // Test the Receiving Pipe Data
      expect(model, isA<CheckDepositViewModel>());
      expect(model.id, '1122334455');
    }
  }));
}

void resetEntityInRepository() {
  final CheckDepositEntity entity = CheckDepositEntity();
  ExampleLocator()
      .repository
      .create<CheckDepositEntity>(entity, (_){}, deleteIfExists: true);
}

DateTime getLastMidnight() {
  final now = DateTime.now();
  final lastMidnight = new DateTime(now.year, now.month, now.day);
  return lastMidnight;
}

