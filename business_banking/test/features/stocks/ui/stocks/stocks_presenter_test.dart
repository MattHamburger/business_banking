// @dart=2.9
import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:business_banking/features/stocks/ui/stocks/stocks_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class StocksBlocMock extends Mock implements StocksBloc {
  final stocksViewModelPipe = Pipe<StocksViewModel>();
}

void main() {
  StocksBlocMock bloc;
  StocksPresenter presenter;
  Widget testWidget;

  setUp(() {
    bloc = StocksBlocMock();
    presenter = StocksPresenter();
    testWidget = MaterialApp(
      home: BlocProvider<StocksBloc>(
        create: (_) => bloc,
        child: presenter,
      ),
    );
  });

  tearDown(() {
    bloc = null;
    testWidget = null;
  });

  testWidgets('StocksPresenter initialization', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(StocksPresenter), findsOneWidget);
  });
}