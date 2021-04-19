import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:business_banking/features/transaction/ui/transaction_presenter.dart';
import 'package:business_banking/features/transaction/ui/transaction_screen.dart';
import 'package:business_banking/features/transaction/ui/transaction_tile.dart';
import 'package:business_banking/features/transaction/ui/transaction_widget.dart';
import 'package:clean_framework/clean_framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Transactions, with true bloc', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<TransactionBloc>(
        create: (_) => TransactionBloc(),
        child: TransactionWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TransactionPresenter), findsOneWidget);
  });

  testWidgets(
      'Given a TransactionViewModel, builds TransactionTile',
      (tester) async {
    TransactionViewModel transactionViewModel;

    transactionViewModel = TransactionViewModel(transactionDetails: [
      TransactionModel(
          debit: true,
          transactionAmount: 200.23,
          transactionTitle: 'Gas Station',
          transactionId: '0000006',
          transactionCategory: 'gas',
          payTo: "Merchant6",
          date: DateTime.fromMillisecondsSinceEpoch(1618237756 * 1000)),
    ]);

    final testWidget = MaterialApp(
      home: BlocProvider<TransactionBloc>(
        create: (_) => TransactionBloc(),
        child: Scaffold(
          body: TransactionScreen(
            viewModel: transactionViewModel,
          ),
          // body: TransactionTile(
          //   viewModel: transactionModel,
        ),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TransactionTile), findsOneWidget);
    expect(find.widgetWithText(TransactionTile, "Gas Station"), findsOneWidget);
    expect(find.widgetWithText(TransactionTile, "Gas"), findsOneWidget);
    expect(find.widgetWithText(TransactionTile, "\$200.23"), findsOneWidget);
    expect(find.widgetWithText(TransactionTile, "04/12/2021"), findsOneWidget);
  });
}
