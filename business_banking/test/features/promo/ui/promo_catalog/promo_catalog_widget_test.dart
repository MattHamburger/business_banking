// @dart=2.9

import 'package:business_banking/features/promo/ui/promo_catalog/promo_catalog_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

void main() {
  Widget buildTestWidget(Widget widget) {
    return MaterialApp(
      home: widget,
    );
  }

  testWidgets('Promo catalog widget shown',
          (WidgetTester tester) async {
            await mockNetworkImagesFor(() => tester
                        .pumpWidget(buildTestWidget(PromoCatalogWidget())));
        expect(find.byType(PromoCatalogWidget), findsOneWidget);
      });
}
