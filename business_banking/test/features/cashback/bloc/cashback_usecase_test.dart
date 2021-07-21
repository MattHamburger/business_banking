import 'package:business_banking/features/cashback/bloc/cashback_usecase.dart';
import 'package:business_banking/features/cashback/model/cashback_entity.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CashbackUsecase getCurrentState', () {
    final useCase = CashbackUsecase((viewModel) {
      expect(viewModel,
          CashbackFormViewModel('', '', CashbackOption.frequentMiles));
      return true;
    });

    useCase.getCurrentState();
  });

  test('CashbackUsecase onCityUpdate', () {
    final useCase = CashbackUsecase((viewModel) {
      expect(
          viewModel,
          CashbackFormViewModel(
              'San Francisco', '', CashbackOption.frequentMiles));
      return true;
    });

    useCase.onCityUpdate('San Francisco');
  });
}
