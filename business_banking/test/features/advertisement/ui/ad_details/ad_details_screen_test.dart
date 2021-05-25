// @dart=2.9
import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:business_banking/features/advertisement/ui/ad_details/ad_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  Widget testWidget;
  AdHubCardViewModel viewModel;

  viewModel = AdHubCardViewModel(
      adTitle: 'Awesome Ad!',
      adIconImage: 'image-url',
      id: 'id',
      adDescription: 'desc',
      adImage: 'imageurl');
  testWidget = MaterialApp(
    home: AdDetailsScreen(viewModel: viewModel),
  );

  testWidgets('AdDetailsScreen initialization', (tester) async {
    await mockNetworkImagesFor(() => tester.pumpWidget(testWidget));
    expect(find.byType(AdDetailsScreen), findsOneWidget);
  });
}
