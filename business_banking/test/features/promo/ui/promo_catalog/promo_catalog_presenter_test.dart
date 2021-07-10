// @dart=2.9

import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/ui/promo_catalog/promo_catalog_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../bloc/promo_hub_card_bloc_mock.dart';

void main() {
  MaterialApp testWidget;
  setUp((){
    testWidget = MaterialApp(
      home: BlocProvider<PromoBloc>(
        create: (_) => PromoBlocMock(),
        child: PromoCatalogPresenter(),
      ),
    );
  });
  tearDown((){
    testWidget = null;
  });

  testWidgets('catalog presenter displayed', (tester) async {
    await mockNetworkImagesFor(() =>  tester.pumpWidget(testWidget));
    final widget = find.byType(PromoCatalogPresenter);
    expect(widget, findsOneWidget);
  });
}