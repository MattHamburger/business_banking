// @dart = 2.9

import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockPromoHubCardPresenterActions extends Mock
  implements PromoHubCardPresenterActions {}

void main() {
  MockPromoHubCardPresenterActions mockPromoHubCardPresenterActions;
  mockPromoHubCardPresenterActions = MockPromoHubCardPresenterActions();
  Widget testWidget;

  final vm = PromoHubCardViewModel(
      income: '100',
      phone: '3101010310',
      icon: 'url',
      incomeFieldStatus: '',
      phoneFieldStatus: '',
      serviceResponseStatus: PromoServiceResponseStatus.succeed);

  testWidget = MaterialApp(
    home: PromoHubCardScreen(
        viewModel: vm,
        actions: mockPromoHubCardPresenterActions),
  );

  testWidgets('PromoHubCardScreen initialization', (tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(testWidget));
    expect(find.byType(PromoHubCardScreen), findsOneWidget);
  });

}
