// @dart=2.9

import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_usecase.dart';
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
    test('verify pipe value output', () async {
      useCase.execute();
      expect(promoViewModel, isNotNull);
    });
  });
}