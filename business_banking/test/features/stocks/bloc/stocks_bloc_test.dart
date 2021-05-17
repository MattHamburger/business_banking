// @dart=2.9
import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks/bloc/stocks_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class StocksUseCaseMock extends Mock implements StocksUseCase{}

void main() {
  test('StocksBloc initialize', () async {
    final bloc = StocksBloc();
    expect(bloc.stocksViewModelPipe, isNotNull);
  });

  test('StocksBloc dispose', () async {
    final bloc = StocksBloc();
    bloc.dispose();
    expect(bloc.stocksViewModelPipe.receive, emitsDone);
  });

  test('StocksBloc StocksUseCase create on pipe listen', () async {
    StocksUseCaseMock stocksUseCaseMock = StocksUseCaseMock();
    StocksBloc bloc =
    StocksBloc(stocksUseCase: stocksUseCaseMock);
    bloc.stocksViewModelPipe.receive.listen((event) {});
    verify(stocksUseCaseMock.create()).called(1);
  });
}