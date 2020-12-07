import 'package:business_banking/features/mortgage/bloc/mortgage_usecase.dart';
import 'package:business_banking/features/mortgage/model/mortgage_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageUseCase initialize and create', () {
    final usecase = MortgageUseCase((viewModel) {
      expect(viewModel, isA<MortgageViewModel>());
    });
    usecase.create();
  });

  test('MortgageUseCase initialize and recreate', () {
    final usecase = MortgageUseCase((viewModel) {
      expect(viewModel, isA<MortgageViewModel>());
    });
    usecase.create();
    usecase.create();
  });

  test('MortgageUseCase initialize with error', () {
    try {
      MortgageUseCase(null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
