// @dart=2.9
import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:business_banking/features/statement/bloc/statement_bloc.dart';
import 'package:business_banking/features/statement/model/hub_cards/statement_cards_view_model.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:business_banking/features/statement/model/statement_info.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_presenter.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_screen.dart';
import 'package:business_banking/features/statement/ui/hub_cards/statement_cards_widget.dart';
import 'package:business_banking/features/statement/ui/statement/statement_presenter.dart';
import 'package:business_banking/features/statement/ui/statement/statement_screen.dart';
import 'package:business_banking/features/statement/ui/statement/statement_widget.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class OnTapButton extends StatelessWidget {
  final String id;
  final void Function(BuildContext) onTap;

  const OnTapButton({Key key, this.id, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(id),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Navigate'),
          onPressed: () => onTap?.call(context),
        ),
      ),
    );
  }
}

void main() {
  testWidgets('WIDGET TEST: Statement Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: StatementWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(StatementPresenter), findsOneWidget);
  });

  testWidgets('WIDGET TEST: StatementCard Widget loaded successfully!',
      (tester) async {
    final testWidget = MaterialApp(
      home: Scaffold(
        body: StatementCardWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);

    expect(find.byType(StatementCardPresenter), findsOneWidget);
  });

  group('card presenter actions testing', () {
    final bloc = StatementBloc();
    final viewModel = StatementCardViewModel(accounts: []);
    final actions = StatementCardPresenterActions(bloc, viewModel);
    final nav = MockNavigatorObserver();
    var navContext;

    testWidgets('routing test', (tester) {
      final testWidget = CFRouterScope(
        routeGenerator: BusinessBankingRouter.generate,
        initialRoute: BusinessBankingRouter.initialRoute,
        builder: (context) => BlocProvider(
          create: (context) {
            navContext = context;
            return StatementBloc();
          },
          child: MaterialApp(
            home: StatementCardScreen(
              viewModel: viewModel,
              presenterActions: actions,
            ),
            navigatorObservers: [nav],
            debugShowCheckedModeBanner: false,
          ),
        ),
      );

      actions.navigateBackToHub(navContext);

      tester.pumpWidget(testWidget);

      verify(nav.didPop(any, any)).called(1);

      return;
    });

    testWidgets('routing statement test', (tester) {
      final testWidget = CFRouterScope(
        routeGenerator: BusinessBankingRouter.generate,
        initialRoute: BusinessBankingRouter.initialRoute,
        builder: (context) => BlocProvider(
          create: (context) {
            navContext = context;
            return StatementBloc();
          },
          child: MaterialApp(
            home: StatementCardScreen(
              viewModel: viewModel,
              presenterActions: actions,
            ),
            navigatorObservers: [nav],
            debugShowCheckedModeBanner: false,
          ),
        ),
      );

      actions.navigateToViewStatement(navContext);

      tester.pumpWidget(testWidget);

      verify(nav.didPush(any, any)).called(1);

      return;
    });
  });
  group('presenter actions testing', () {
    final bloc = StatementBloc();
    final actions = StatementPresenterActions(bloc);
    final nav = MockNavigatorObserver();
    var navContext;

    testWidgets('routing test', (tester) {
      final testWidget = CFRouterScope(
        routeGenerator: BusinessBankingRouter.generate,
        initialRoute: BusinessBankingRouter.initialRoute,
        builder: (context) => BlocProvider(
          create: (context) {
            navContext = context;
            return StatementBloc();
          },
          child: MaterialApp(
            home: StatementScreen(
              viewModel: StatementViewModel(statements: []),
              presenterActions: actions,
            ),
            navigatorObservers: [nav],
            debugShowCheckedModeBanner: false,
          ),
        ),
      );

      actions.navigateBackToHub(navContext);

      tester.pumpWidget(testWidget);

      verify(nav.didPop(any, any)).called(1);

      return;
    });

    testWidgets('alert dialog test', (tester) async {
      final nav = MockNavigatorObserver();
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
      await tester.pumpWidget(MaterialApp(
        home: OnTapButton(
          id: 'errorDialog',
          onTap: (context) {
            actions.sendStatementToEmail(context, statement);
          },
        ),
        navigatorObservers: [nav],
      ));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      verify(nav.didPop(any, any));

      return;
    });
  });
}
