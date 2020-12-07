import 'package:business_banking/features/mortgage/bloc/mortgage_detail_usecase.dart';
import 'package:business_banking/features/mortgage/model/mortgage_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('MortgageDetailUseCase initialize with error', () {
    try {
      MortgageDetailUseCase(null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });

  test('MortgageDetailUseCase initialize and create', () {
    final usecase = MortgageDetailUseCase((viewModel) {
      expect(viewModel, isA<MortgageDetailViewModel>());
    });
    usecase.create();
  });

  test('MortgageDetailUseCase initialize and recreate', () {
    final usecase = MortgageDetailUseCase((viewModel) {
      expect(viewModel, isA<MortgageDetailViewModel>());
    });
    usecase.create();
    usecase.create();
  });
}
