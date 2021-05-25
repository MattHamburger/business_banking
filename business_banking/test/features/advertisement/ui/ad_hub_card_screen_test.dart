// @dart=2.9
import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:business_banking/features/advertisement/ui/ad_hub_card_presenter.dart';
import 'package:business_banking/features/advertisement/ui/ad_hub_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class AdHubCardActionsMock extends Mock implements AdHubCardPresenterActions {}

void main() {
  AdHubCardActionsMock actions;
  Widget testWidget;
  AdHubCardViewModel viewModel;

  viewModel = AdHubCardViewModel(
      adTitle: 'Awesome Ad!',
      adIconImage: 'image-url',
      id: 'id',
      adDescription: 'desc',
      adImage: 'imageurl');
  actions = AdHubCardActionsMock();
  testWidget = MaterialApp(
    home: AdHubCardScreen(viewModel: viewModel, actions: actions),
  );

  testWidgets('AdHubCardScreen initialization', (tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(testWidget));
    expect(find.byType(AdHubCardScreen), findsOneWidget);
  });

  testWidgets('AdHubCardScreen onTap test', (tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(testWidget));
    await tester.pumpWidget(testWidget);

    // navigate to ad details screen
    var widget = find.byKey(Key('Ad-Card-Learn-More-Button'));
    expect(widget, findsOneWidget);
    await tester.tap(widget);
    verify(actions.navigateToCreditCardDetails(any)).called(1);
  });
}
