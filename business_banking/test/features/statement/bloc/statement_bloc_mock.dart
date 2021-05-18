// @dart=2.9

import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/statement/bloc/statement/statement_event.dart';
import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_view_model.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class StatementBlockMock extends Mock implements StatementBloc {
  @override
  Pipe<StatementCardViewModel> statementCardViewModelPipe =
      Pipe<StatementCardViewModel>();

  @override
  Pipe<StatementViewModel> statementViewModelPipe = Pipe<StatementViewModel>();

  @override
  Pipe<StatementEvent> statementEventPipe = Pipe<StatementEvent>();

  StatementCardViewModel statementCardViewModelSample = StatementCardViewModel(
    accounts: [
      AccountInfoStruct(
          accountNickname: 'Checking Account (...6917)',
          accountNumber: '1234567890126917',
          availableBalance: 481.84,
          depositLimit: 4500.0),
      AccountInfoStruct(
          accountNickname: 'Wells Fargo (6537)',
          accountNumber: '12345678932246917',
          availableBalance: 1441.84,
          depositLimit: 4500.00),
    ],
  );

  StatementViewModel statementViewModelSample = StatementViewModel(statements: [
    Statement(
        accountInfo: AccountInfoStruct(
            accountNickname: 'HNB Credit Card (6917)',
            accountNumber: '1234567890126917',
            availableBalance: 481.84,
            depositLimit: 4500.0),
        statementActivity: [
          StatementActivity(
              "LYFT RIDE", "04/13/2021 00:00:00", null, 200.00, 1200.00),
          StatementActivity(
              "PAYCHECK", "04/14/2021 00:00:00", null, 400.00, 1600.00)
        ]),
    Statement(
        accountInfo: AccountInfoStruct(
            accountNickname: 'Wells Fargo (6537)',
            accountNumber: '12345678932246917',
            availableBalance: 1441.84,
            depositLimit: 4500.00),
        statementActivity: [
          StatementActivity(
              "UBER RIDE", "04/13/2021 00:00:00", 54.00, null, 95.00),
          StatementActivity(
              "TRANSFER", "04/13/2021 00:00:00", null, 100.00, 195.00)
        ])
  ]);

  StatementBlockMock() {
    statementCardViewModelPipe.whenListenedDo(() {
      statementCardViewModelPipe.send(
        statementCardViewModelSample,
      );
    });

    statementViewModelPipe.whenListenedDo(() {
      statementViewModelPipe.send(
        statementViewModelSample,
      );
    });

    statementEventPipe.receive.listen(statementEventPipeHandler);
  }
}
