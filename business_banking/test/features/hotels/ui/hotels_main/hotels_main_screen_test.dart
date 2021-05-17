// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:business_banking/features/hotels/ui/hotels_main/hotels_main_screen.dart';
import 'package:business_banking/features/hotels/ui/hotels_actions.dart';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';

class MockHotelsActions extends Mock implements HotelsActions {}

void main() {
  HotelsListViewModel viewModel;
  MockHotelsActions mockActions;
  Widget testWidget;

  setUp(() {
    final baseUrl =
        'https://assets.cyllenius.com/resize_230x230/media/vegas/resorts/';

    HotelViewModel luxor = HotelViewModel(
        title: 'Luxor',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: true,
        starRating: 2.5,
        price: 59.99,
        //imageUrl: baseUrl + 'luxor/1024x1024_luxor_new.jpg');
        imageUrl: '');

    HotelViewModel ti = HotelViewModel(
        title: 'Treasure Island',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: false,
        starRating: 1.5,
        price: 22.21,
        //imageUrl: baseUrl + 'treasure/1024x1024_ti.jpg');
        imageUrl: '');

    HotelViewModel aria = HotelViewModel(
        title: 'Aria',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: false,
        starRating: 4.7,
        price: 162.06,
        //imageUrl: baseUrl + 'aria/1024x1024_aria.jpg');
        imageUrl: '');

    HotelViewModel xcal = HotelViewModel(
        title: 'Excalibur',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: true,
        starRating: 2.5,
        price: 61.00,
        //imageUrl: baseUrl + '/excalibur/1024x1024_excalibur.jpg');
        imageUrl: '');

    HotelViewModel flam = HotelViewModel(
        title: 'Flamingo',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: true,
        starRating: 3.8,
        price: 78.06,
        //imageUrl: baseUrl + '/flamingo/1024x1024_flamingo.jpg');
        imageUrl: '');

    HotelViewModel paris = HotelViewModel(
        title: 'Paris',
        city: 'Las Vegas',
        stateCode: 'NV',
        isLiked: true,
        starRating: 3.5,
        price: 82.10,
        //imageUrl: baseUrl + '/paris/1024x1024_paris.jpg');
        imageUrl: '');

    final hotelList = [luxor, ti, aria, xcal, flam, paris];
    viewModel = HotelsListViewModel(hotels: hotelList);
    mockActions = MockHotelsActions();

    testWidget = MaterialApp(
        home: HotelsMainScreen(
      viewModel: viewModel,
      actions: mockActions,
    ));

    print('Test Widget sdo');
  });

  tearDown(() {
    viewModel = null;
    mockActions = null;
    testWidget = null;
  });

  testWidgets('HotelsMainScreen Test', (tester) async {
    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    // Find Main Scree, find Icons.
    expect(find.byType(HotelsMainScreen), findsOneWidget);
    expect(find.byIcon(Icons.check), findsWidgets);

    final List<HotelViewModel> hotelList = viewModel.hotels;
    HotelViewModel hotel;
    String titleString;
    String subString;

    for (int i = 0; i < hotelList.length; i++) {
      //
      hotel = hotelList[i];
      titleString = hotel.title + '\n' + "\$" + hotel.price.toStringAsFixed(2);
      subString = hotel.starRating.toString() + ' Stars';

      expect(find.text(titleString), findsOneWidget);
      expect(
          find.text(subString), findsWidgets); // Star numbers can be similar.
    }
  });
}
