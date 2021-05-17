import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';
import 'package:business_banking/features/hotels/ui/hotels_actions.dart';
import 'package:business_banking/features/hotels/model/hotel_view_model.dart';

class HotelsHubScreen extends Screen {
  final HotelsListViewModel viewModel;
  final HotelsActions actions;

  HotelsHubScreen({required this.viewModel, required this.actions});

  _onTapHandler(BuildContext context) {
    //
    List<HotelViewModel> hList = this.viewModel.hotels;
    if (hList.length > 0) actions.navigateToHotels(context);
  }

  @override
  Widget build(BuildContext context) {
    List<HotelViewModel> hList = this.viewModel.hotels;

    String titleString = 'No data available.';
    String subString = 'Please try again later.';

    if (hList.length > 0) {
      final HotelViewModel firstHotel = hList.first;
      titleString = firstHotel.title;
      subString = "\$" + firstHotel.price.toStringAsFixed(2);
    }

    Text title = Text(
      titleString,
      style: TextStyle(color: Colors.black, fontSize: 20),
    );

    ListTile tile = ListTile(
      onTap: () => _onTapHandler(context),
      contentPadding: EdgeInsets.zero,
      trailing: Icon(Icons.hotel, color: Colors.black, size: 30),
      title: title,
      subtitle: Text(subString),
    );

    return Container(
      height: 150,
      padding: EdgeInsets.all(5.0),
      child: Card(
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Row(
                  children: [
                    const Text(
                      'Latest Hotel',
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              tile
            ],
          ),
        ),
      ),
    );
  }
}
