import 'package:auto_size_text/auto_size_text.dart';
import 'package:business_banking/features/hotels/ui/hotels_actions.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'package:business_banking/features/hotels/model/hotel_view_model.dart';
import 'package:business_banking/features/hotels/model/hotels_list_view_model.dart';

class HotelsMainScreen extends Screen {
  //
  HotelsListViewModel viewModel;
  final HotelsActions actions;

  HotelsMainScreen({required this.viewModel, required this.actions});

  @override
  Widget build(BuildContext context) {
    List<Widget> columnList = [];

    List<HotelViewModel> hList = this.viewModel.hotels;
    if (hList.length > 0) {
      ListView lView = ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: this.viewModel.hotels.length,
          itemBuilder: (context, index) {
            return _buildHotelEntry(hList[index]);
          });

      columnList.add(Expanded(child: lView));
    }

    // Main Container
    Container bodyContainer = Container(
      child: Column(children: columnList),
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.black,
    );

    return Scaffold(
      body: bodyContainer,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AutoSizeText(
              'Hotels',
              key: Key('ADappBarL4'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelEntry(HotelViewModel viewModel) {
    Color likedColor = viewModel.isLiked ? Colors.green : Colors.grey.shade300;

    Widget trailing = Icon(Icons.hotel, color: Colors.black, size: 30);
    if (viewModel.imageUrl.length > 10)
      trailing = Image.network(viewModel.imageUrl);

    ListTile lt = ListTile(
        onTap: () => actions.hotelClicked(viewModel),
        leading: Icon(
          Icons.check,
          color: likedColor,
          size: 30,
        ),
        trailing: trailing,
        title: Text(viewModel.title + '\n' + _formatPrice(viewModel.price)),
        subtitle: Text(viewModel.starRating.toString() + ' Stars'));

    // Card
    Card card = Card(child: lt);

    return card;
  }

  String _formatPrice(double priceValue) {
    String newPrice = "\$" + priceValue.toStringAsFixed(2);
    return newPrice;
  }
}
