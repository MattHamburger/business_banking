// @dart = 2.9

import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter_actions.dart';
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

  Widget testWidgetSucceed;
  Widget testWidgetFailed;

  PromoHubCardViewModel viewModelFailed;
  PromoHubCardViewModel viewModelSucceed;

  setUp((){
    viewModelSucceed = PromoHubCardViewModel(
        income: '100',
        phone: '3101010310',
        icon: 'url',
        incomeFieldStatus: '',
        phoneFieldStatus: '',
        serviceResponseStatus: PromoServiceResponseStatus.succeed,
        promotions: []
    );

    viewModelFailed = PromoHubCardViewModel(
        income: 'fail',
        phone: 'fail',
        icon: 'url',
        incomeFieldStatus: 'Enter correct numbers',
        phoneFieldStatus: 'Enter correct phone number',
        serviceResponseStatus: PromoServiceResponseStatus.failed,
        promotions: []
    );

    testWidgetSucceed = MaterialApp(
      home: PromoHubCardScreen(
          viewModel: viewModelSucceed,
          actions: mockPromoHubCardPresenterActions),
    );

    testWidgetFailed = MaterialApp(
      home: PromoHubCardScreen(
          viewModel: viewModelFailed,
          actions: mockPromoHubCardPresenterActions),
    );
  });

  tearDown((){
    viewModelFailed = null;
    viewModelSucceed = null;
  });

  Future<void> pumpGetOffersButton(
    WidgetTester tester, MaterialApp testWidget) async {
   await tester.pumpWidget(testWidget);
   await tester.pumpAndSettle();
   var widget = find.text('Get Offers');
   expect(widget, findsOneWidget);
   await tester.tap(widget);
   await tester.pumpAndSettle();
  }

  group('PromoHubCardScreen tests',(){

    testWidgets('PromoHubCardScreen built and found', (tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(testWidgetSucceed));
      expect(find.byType(PromoHubCardScreen), findsOneWidget);
    });

    testWidgets('Static content widgets found',(tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pumpAndSettle();
      final widgetType = find.byType(PromoHubCardScreen);
      expect(widgetType, findsOneWidget);
      expect(find.text('Offers crafted just for you!'), findsOneWidget);
      expect(find.text('Get Offers'), findsOneWidget);
      expect(find.text('Yearly income'), findsOneWidget);
      expect(find.text('Phone (***) *** ****'), findsOneWidget);
    });

    testWidgets('User input is being displayed',(tester) async {
      await tester.pumpWidget(testWidgetSucceed);
      await tester.pumpAndSettle();
      expect(find.text(viewModelSucceed.phone), findsOneWidget);
      expect(find.text(viewModelSucceed.income), findsOneWidget);
      var incomeField = find.byKey(Key('income_key'));
      expect(incomeField, findsOneWidget);
      var phoneField = find.byKey(Key('phone_key'));
      expect(phoneField, findsOneWidget);
      await tester.enterText(incomeField, '88888');
      await tester.enterText(phoneField, '2223332233');
      await tester.pumpAndSettle();
      expect(find.text('88888'), findsOneWidget);
      expect(find.text('2223332233'), findsOneWidget);
    });

    testWidgets('Validation messages displayed',(tester) async {
      await pumpGetOffersButton(tester, testWidgetFailed);
      expect(find.text('Enter correct numbers'), findsOneWidget);
      expect(find.text('Enter correct phone number'), findsOneWidget);
    });
  });
}
