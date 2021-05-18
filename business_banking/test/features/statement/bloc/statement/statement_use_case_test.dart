// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/bloc/statement/statement_usecase.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement/statement_entity.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:test/test.dart';

void main() {
  StatementUseCase useCase;
  StatementViewModel statementViewModel;

  setUp(() {
    useCase = StatementUseCase((viewModel) {
      statementViewModel = viewModel;
      return true;
    });
  });

  group('Statement Usecase', () {
    final tStatements = [
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
    ];
    final tSucceedStatementInfo = StatementViewModel(
        statements: tStatements,
        serviceResponseStatus: ServiceResponseStatus.succeed);

    final tStatementEntity =
        StatementEntity(statements: tStatements, errors: [EntityFailure()]);
    test('should callback return viewModel the same as source value', () async {
      await useCase.create();

      expect(
        statementViewModel,
        tSucceedStatementInfo,
      );
    });

    test('should callback return viewModel without recreate new scope',
        () async {
      await useCase.create();

      expect(statementViewModel, isA<StatementViewModel>());
      useCase.create();
    });
    test(
        'should service response be failed when built view model with entity that has error',
        () async {
      statementViewModel = useCase.buildViewModel(tStatementEntity);

      expect(statementViewModel.serviceResponseStatus,
          ServiceResponseStatus.failed);
    });

    test('send statement email test', () async {
      await useCase.create();

      expect(statementViewModel.emailServiceStatus, EmailServiceStatus.initial);

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

      await useCase.sendStatementAsPdf(statement, ['example@gmail.com']);

      expect(statementViewModel.emailServiceStatus, EmailServiceStatus.error);
    });
  });
}
