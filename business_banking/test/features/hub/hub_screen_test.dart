// @dart=2.9
import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/new_online_registration_form/ui/new_online_registration_form_entry/new_online_registration_widget.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  MaterialApp testWidget;
  setUp(() {
    testWidget = MaterialApp(
      home: HubScreen(),
    );
  });
  tearDown(() {
    testWidget = null;
  });
  group('Create HubScreen', () {
    testWidgets('should show PromoWidget',
        (tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(testWidget));
      final widgetType = find.byType(PromoWidget);
      expect(widgetType, findsOneWidget);
    });
  });
}
