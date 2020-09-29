import 'package:business_banking/features/mortgage_accounts/ui/mortgage_accounts_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_bloc.dart';
import 'package:business_banking/features/mortgage_accounts/ui/mortgage_accounts_widget.dart';
import 'package:business_banking/features/mortgage_accounts/ui/mortgage_accounts_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MortgageAccounts, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<MortgageAccountsBloc>(
            create: (_) => MortgageAccountsBloc(), child: MortgageAccountsWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(MortgageAccountsPresenter), findsOneWidget);
    expect(find.byType(MortgageAccountsScreen), findsOneWidget);
    expect(find.text('Account Balance:'), findsOneWidget);
    expect(find.byKey(Key('mortgageAccountbalance')), findsOneWidget);
  });

  testWidgets('MortgageAccountDetailNavigation, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<MortgageAccountsBloc>(
            create: (_) => MortgageAccountsBloc(), child: MortgageAccountsWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    await tester.tap(find.byKey(Key('mortgageAccountCard1')));
    await tester.pumpAndSettle();
  });
}