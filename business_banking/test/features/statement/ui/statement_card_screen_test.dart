// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_view_model.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_presenter.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockStatementBloc extends Fake implements StatementBloc {}

class MockStatementCardActions extends Mock
    implements StatementCardPresenterActions {}

void main() {
  MockStatementBloc bloc;

  setUpAll(() async {
    bloc = MockStatementBloc();
  });

  tearDownAll(() async {
    bloc.dispose();
  });

  group('View StatementCardScreen tests', () {
    testWidgets('pumping StatementCardScreen with test data', (tester) async {
      final tAccountListInfo = [
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
      ];

      final viewModel = StatementCardViewModel(
          accounts: tAccountListInfo,
          serviceResponseStatus: ServiceResponseStatus.succeed);

      MockStatementCardActions mockActions = MockStatementCardActions();

      final testWidget = MaterialApp(
        home: StatementCardScreen(
          viewModel: viewModel,
          presenterActions: mockActions,
        ),
      );

      await tester.pumpWidget(testWidget);
      await tester.pumpAndSettle();
      expect(find.text("View Account Statements"), findsOneWidget);
    });
  });
}
