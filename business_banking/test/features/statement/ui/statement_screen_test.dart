// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';
import 'package:business_banking/features/statement/ui/statement/statement_presenter.dart';
import 'package:business_banking/features/statement/ui/statement/statement_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockStatementActions extends Mock implements StatementPresenterActions {}

void main() {
  group('Statement Screen tests', () {
    testWidgets('pumping StatementScreen with test data', (tester) async {
      final mockActions = MockStatementActions();
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
          serviceResponseStatus: ServiceResponseStatus.succeed);

      final testWidget = MaterialApp(
        home: StatementScreen(
          viewModel: viewModel,
          presenterActions: mockActions,
        ),
      );

      final viewModelError = StatementViewModel(
          statements: _statements,
          serviceResponseStatus: ServiceResponseStatus.succeed,
          emailServiceStatus: EmailServiceStatus.error);

      final testWidgetError = MaterialApp(
        home: StatementScreen(
          viewModel: viewModelError,
          presenterActions: mockActions,
        ),
      );

      final viewModelSuccess = StatementViewModel(
          statements: _statements,
          serviceResponseStatus: ServiceResponseStatus.succeed,
          emailServiceStatus: EmailServiceStatus.success);

      final testWidgetSuccess = MaterialApp(
        home: StatementScreen(
          viewModel: viewModelSuccess,
          presenterActions: mockActions,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpWidget(testWidgetError);
      await tester.pumpWidget(testWidgetSuccess);
      await tester.pumpAndSettle();
      var list = find.byKey(Key('statementListView'));
      expect(list, findsNWidgets(2));
    });
  });
}
