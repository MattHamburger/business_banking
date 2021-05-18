// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MODEL TEST: On success StatementViewModel should initialize.',
      () async {
    final _statements = [
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
    final viewModel = StatementViewModel(
        statements: _statements,
        serviceResponseStatus: ServiceResponseStatus.succeed,
        emailServiceStatus: EmailServiceStatus.initial);
    expect(viewModel.props, [
      viewModel.statements,
      viewModel.serviceResponseStatus,
      viewModel.emailServiceStatus
    ]);

    expect(viewModel.stringify, true);

    expect(
        viewModel.statements.first.accountInfo,
        AccountInfoStruct(
            accountNickname: 'HNB Credit Card (6917)',
            accountNumber: '1234567890126917',
            availableBalance: 481.84,
            depositLimit: 4500.0));

    expect(viewModel.statements.first.statementActivity.first.props, [
      viewModel.statements.first.statementActivity.first.description,
      viewModel.statements.first.statementActivity.first.date,
      viewModel.statements.first.statementActivity.first.additions,
      viewModel.statements.first.statementActivity.first.subtractions,
      viewModel.statements.first.statementActivity.first.balance
    ]);
  });

  test('NULL Statement TEST', () async {
    final statement = Statement.fromJson({});

    expect(statement.accountInfo, AccountInfoStruct());
    expect(statement.statementActivity, []);
  });
}
