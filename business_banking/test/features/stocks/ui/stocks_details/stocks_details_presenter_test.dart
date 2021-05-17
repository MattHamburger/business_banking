// @dart=2.9

import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks/ui/stocks_details/stocks_details_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class StocksBlocMock extends Mock implements StocksBloc {}

void main() {
  StocksBlocMock bloc;
  StocksDetailsPresenter presenter;
  Widget testWidget;

  setUp(() {
    bloc = StocksBlocMock();
    presenter = StocksDetailsPresenter();
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

}