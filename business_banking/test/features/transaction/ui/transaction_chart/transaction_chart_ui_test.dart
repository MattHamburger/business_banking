import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:business_banking/features/transaction/ui/transaction_chart/transaction_chart_screen.dart';
import 'package:business_banking/features/transaction/ui/transaction_chart/transaction_chart_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Transactions, with true bloc', (tester) async {
    navigateToHubScreen() {}
    final testWidget = MaterialApp(
      home: BlocProvider<TransactionBloc>(
        create: (_) => TransactionBloc(),
        child: TransactionChartScreen(
          viewModel: TransactionViewModel(transactionDetails: []),
          navigateToHubScreen: navigateToHubScreen(),
        ),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TransactionChartScreen), findsOneWidget);
  });

  testWidgets('Transactions Pie Chart Widget Successfully Builds',
      (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<TransactionBloc>(
        create: (_) => TransactionBloc(),
        child: TransactionChartWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TransactionChartWidget), findsOneWidget);
  });
}
