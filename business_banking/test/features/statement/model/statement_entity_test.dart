// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement/statement_entity.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  StatementEntity entity;

  setUp(() {
    //dummy data
    entity = StatementEntity(statements: [
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
  });

  tearDown(() {
    entity = null;
  });

  test('testing StatementEntity attributes', () async {
    expect(entity.props, [
      entity.errors,
      entity.statements,
    ]);

    expect(entity.stringify, true);
    expect(entity.statements.first.accountInfo.accountNickname,
        'HNB Credit Card (6917)');
    expect(entity.statements.first.statementActivity.first.balance, 1200.00);
    expect(entity.statements?.length, 2);
  });

  test('testing entity init failure', () async {
    expect(entity.props, [
      entity.errors,
      entity.statements,
    ]);

    //testing merge method
    final merged = entity.merge(errors: [GeneralEntityFailure()]);
    expect(merged.hasErrors(), true);
    expect(merged.errors.first, isA<GeneralEntityFailure>());
  });
}
