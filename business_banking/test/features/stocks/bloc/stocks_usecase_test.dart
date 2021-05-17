import 'package:business_banking/features/stocks/bloc/stocks_usecase.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('StocksUseCase create', () async {
    var _viewModel;
    final useCase = StocksUseCase((viewModel) {
      _viewModel = viewModel;
      return true;
    });
    await useCase.create();
    expect(_viewModel, isA<StocksViewModel>());
  });
}