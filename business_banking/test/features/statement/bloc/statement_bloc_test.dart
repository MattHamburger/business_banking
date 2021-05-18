// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/statement/bloc/hub_cards/statement_cards_use_case.dart';
import 'package:business_banking/features/statement/bloc/statement/statement_event.dart';
import 'package:business_banking/features/statement/bloc/statement/statement_usecase.dart';
import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';

import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class StatementUseCaseMock extends Mock implements StatementUseCase {}

class StatementCardUseCaseMock extends Mock implements StatementCardUseCase {}

void main() {
  StatementBloc bloc;
  StatementCardUseCaseMock mockStatementCardUseCase;
  StatementUseCaseMock mockStatementUseCase;
  setUp(() {
    mockStatementCardUseCase = StatementCardUseCaseMock();
    mockStatementUseCase = StatementUseCaseMock();
    bloc = StatementBloc(
        statementCardUseCase: mockStatementCardUseCase,
        statementUseCase: mockStatementUseCase);
  });

  tearDown(() {
    bloc.dispose();
  });
  group('', () {
    test(
        'statementCardViewModelPipe streams out StatementViewModel to listeners.',
        () {
      bloc.statementCardViewModelPipe.receive.listen((model) {
        verify(mockStatementCardUseCase.create()).called(1);
      });
    });

    test('statementViewModelPipe streams out StatementViewModel to listeners.',
        () {
      bloc.statementViewModelPipe.receive.listen((model) {
        verify(mockStatementCardUseCase.create()).called(1);
      });
    });

    test('StatementBloc statementEventsPipeHandler', () async {
      final statement = Statement(
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
          ]);

      var event = SendStatementToEmail(statement, "example@gmail.com");

      expect(event.props, [event.statement, event.recipient]);
      expect(event.stringify, true);

      bloc.statementEventPipeHandler(event);
      verify(mockStatementUseCase.sendStatementAsPdf(any, any)).called(1);
    });
  });
}
