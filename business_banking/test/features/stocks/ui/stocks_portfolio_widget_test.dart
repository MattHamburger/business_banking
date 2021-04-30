import 'package:business_banking/features/stocks_detail/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_detail/ui/stocks_portfolio_presenter.dart';
import 'package:business_banking/features/stocks_detail/ui/stocks_portfolio_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('StocksPortfolio', (tester) async {
    final stocksWidget = MaterialApp(
      home: BlocProvider(
        create: (_) => StocksBloc(),
        child: StocksPortfolioWidget(),
      ),
    );

     await tester.pumpWidget(stocksWidget);
     await tester.pump(Duration(milliseconds: 500));

     expect(find.byType(StocksPortfolioPresenter), findsOneWidget);
  });

 
}
