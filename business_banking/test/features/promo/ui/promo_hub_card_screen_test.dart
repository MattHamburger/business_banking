// @dart=2.9
import 'package:business_banking/features/promo/ui/promo_hub_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';


void main() {
  Widget testWidget;

  testWidget = MaterialApp(
    home: PromoHubCardScreen(),
  );

  testWidgets('PromoHubCardScreen initialization', (tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(testWidget));
    expect(find.byType(PromoHubCardScreen), findsOneWidget);
  });

  //TODO: uncomment below when CTA is implemented
  // testWidgets('PromoHubCardScreen onTap test', (tester) async {
  //   await mockNetworkImagesFor(() => tester.pumpWidget(testWidget));
  //   await tester.pumpWidget(testWidget);

    // navigate to ad details screen
    // var widget = find.byKey(Key('Promo-Card-Learn-More-Button'));
    // expect(widget, findsOneWidget);
    // await tester.tap(widget);
    //TODO: implement below
    //verify(actions.navigateToPromoCatalog(any)).called(1);
  //});
}
