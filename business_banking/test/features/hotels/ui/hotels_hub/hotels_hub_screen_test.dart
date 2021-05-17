// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';
import 'package:business_banking/features/hotels/ui/hotels_actions.dart';
import 'package:business_banking/features/hotels/ui/hotels_hub/hotels_hub_screen.dart';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';

class MockHotelsActions extends Mock implements HotelsActions {}

void main() {
  HotelsListViewModel viewModel;
  MockHotelsActions mockActions;
  Widget testWidget;

  setUp(() {
    HotelViewModel luxor = HotelViewModel(
        title: 'Luxor',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: true,
        price: 59.99,
        starRating: 2.5,
        imageUrl:
            'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/luxor/1024x1024_luxor_new.jpg');

    HotelViewModel ti = HotelViewModel(
        title: 'Treasure Island',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: false,
        price: 22.21,
        starRating: 1.5,
        imageUrl:
            'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/treasure/1024x1024_ti.jpg');

    viewModel = HotelsListViewModel(hotels: [luxor, ti]);
    mockActions = MockHotelsActions();

    testWidget = MaterialApp(
        home: HotelsHubScreen(
      viewModel: viewModel,
      actions: mockActions,
    ));
  });

  tearDown(() {
    viewModel = null;
    mockActions = null;
    testWidget = null;
  });

  testWidgets('HotelsHubScreen Test', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));
    expect(find.byType(HotelsHubScreen), findsOneWidget);
  });
}
