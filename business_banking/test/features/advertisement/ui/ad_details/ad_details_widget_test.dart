// @dart=2.9
import 'package:business_banking/features/advertisement/ui/ad_details/ad_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  testWidgets('AdHubCardWidget initialization', (tester) async {
    Widget adHubCard = AdDetailsWidget();
    await mockNetworkImagesFor(() => tester.pumpWidget(adHubCard));
    Widget testWidget = MaterialApp(
      home: adHubCard,
    );
    await mockNetworkImagesFor(() => tester.pumpWidget(testWidget));
    expect(find.byType(AdDetailsWidget), findsOneWidget);
  });
}
