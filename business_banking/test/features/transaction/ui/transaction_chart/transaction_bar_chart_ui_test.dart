import 'package:business_banking/features/transaction/bloc/transaction_bloc.dart';
import 'package:business_banking/features/transaction/ui/transaction_bar_chart/transaction_bar_chart_presenter.dart';
import 'package:business_banking/features/transaction/ui/transaction_bar_chart/transaction_bar_chart_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TransactionBarChartWidget, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<TransactionBloc>(
      child: TransactionBarChartWidget(),
      create: (_) => TransactionBloc(),
    ));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TransactionBarChartPresenter), findsOneWidget);
  });
}
