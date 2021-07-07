// @dart=2.9

import 'package:business_banking/features/promo/model/promo_entity.dart';
import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_usecase.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PromoHubCardUseCase useCase;
  PromoHubCardViewModel promoViewModel;

  setUp((){
    useCase = PromoHubCardUseCase((viewModel) {
      promoViewModel = viewModel as PromoHubCardViewModel;
      return true;
    });
  });

  group('PromoUseCase',(){
    test('Verify pipe value output', () async {
      useCase.execute();
      expect(promoViewModel, isNotNull);
    });

    test(
        'Verification of viewModel field updates',
            () async {
          useCase.execute();
          useCase.updateInput('123', '111221122');
          expect(promoViewModel.income, '123');
          print(promoViewModel.incomeFieldStatus);
          expect(promoViewModel.incomeFieldStatus, '');
          print(promoViewModel.incomeFieldStatus);
          expect(promoViewModel.phone, '111221122');
          expect(promoViewModel.phoneFieldStatus, '');
        });

    test(
        'Verification of non empty (invalid input) validation status',
            () async {
          useCase.execute();
          useCase.updateInput('aab', 'abc');
          expect(promoViewModel.income, 'aab');
          expect(promoViewModel.incomeFieldStatus, 'Enter correct numbers');
          print(promoViewModel.incomeFieldStatus);
          expect(promoViewModel.phone, 'abc');
          expect(promoViewModel.phoneFieldStatus, 'Enter correct phone number');
        });

    test(
        'Verify failing response status when entity passed to buildViewModel()'
            'contains errors',
            () async {
          final entity = PromoEntity(
              errors: [EntityFailure()],
              income: '1000',
            phone: '',
            icon: '',
          );
          promoViewModel = useCase.buildViewModel(entity: entity);

          expect(promoViewModel.serviceResponseStatus,
              PromoServiceResponseStatus.failed);
        });
  });
}