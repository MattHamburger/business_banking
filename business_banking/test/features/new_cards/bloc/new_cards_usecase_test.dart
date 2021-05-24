// @dart=2.9

import 'package:business_banking/features/budget/bloc/accounts_card_usecase.dart';
import 'package:business_banking/features/budget/bloc/transactions_usecase.dart';
import 'package:business_banking/features/budget/model/account_info.dart';
import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/model/chart_data_model.dart';
import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:business_banking/features/new_cards/models/new_cards_entity.dart';
import 'package:business_banking/locator.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNewCardsEntity extends Mock implements NewCardsEntity {}

main() {
  group('NewCards usecase tests', () {
    test('testing create method', () async {
      AccountsCardUseCase useCase = AccountsCardUseCase((viewModel) {
        expect(viewModel, isA<BudgetViewModel>());
      });
      useCase.create();
    });

    test('testing BudgetEntity creation', () async {
      final entity = BudgetEntity();

      ExampleLocator()
          .repository
          .create<BudgetEntity>(entity, (_) {}, deleteIfExists: true);
      // await Future.delayed(Duration(milliseconds: 200));

      AccountsCardUseCase useCase = AccountsCardUseCase((viewModel) {
        final _scope =
            ExampleLocator().repository.containsScope<BudgetEntity>();
        final entity = ExampleLocator().repository.get<BudgetEntity>(_scope);
        expect(entity, isA<BudgetEntity>());
        expect(viewModel, isA<BudgetViewModel>());
      });
      useCase.create();
    });
  });

  group('', () {
    test('testing create method', () async {
      TransactionsUseCase useCase = TransactionsUseCase((viewModel) {
        expect(viewModel, isA<BudgetViewModel>());
      });
      useCase.create();
    });

    test('testing BudgetEntity creation', () async {
      final entity = BudgetEntity();

      ExampleLocator()
          .repository
          .create<BudgetEntity>(entity, (_) {}, deleteIfExists: true);
      // await Future.delayed(Duration(milliseconds: 200));

      TransactionsUseCase useCase = TransactionsUseCase((viewModel) {
        final _scope =
            ExampleLocator().repository.containsScope<BudgetEntity>();
        final entity = ExampleLocator().repository.get<BudgetEntity>(_scope);
        expect(entity, isA<BudgetEntity>());
        expect(viewModel, isA<BudgetViewModel>());
      });
      useCase.create();
    });

    test('testing merge method', () async {
      final _postedTxns = PostedTransactions('2021-04-04T19:00:03Z',
          'SUNRISE MINI MART', 2.00, 'Wholesale Clubs', 'xxxx-xxxx-xxxx-6917');

      final entity = BudgetEntity(
          accountInfo: AccountInfo('1234567890', 1.00, 'Account Nickname'),
          allTransactions: [_postedTxns]);

      ExampleLocator()
          .repository
          .create<BudgetEntity>(entity, (_) {}, deleteIfExists: true);

      TransactionsUseCase useCase = TransactionsUseCase((viewModel) {
        expect(viewModel, isA<BudgetViewModel>());
      });
      useCase.create();

      useCase.updateViewModelWithChartData(entity).then((value) {
        expect(value, isA<BudgetEntity>());
        expect(value.chartData, isA<List<Series<ChartDataModel, int>>>());
      });
    });
  });
}
