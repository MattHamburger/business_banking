import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class PromoCatalogScreen extends Screen {

  final PromoHubCardViewModel viewModel;

  PromoCatalogScreen({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Checking Account Promotions'),
      ),
      backgroundColor: Colors.grey[300],
      body: Card(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 20.0),
                child: Center(
                  child: Image.network(
                      'https://www.huntington.com/-/media/hcom/BackgroundImages/white-green-hex-outlines.jpg'),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18.0, horizontal: 20.0),
                    child: Center(
                        child:
                            Text('Promotions for you', style: TextStyle(fontSize: 24))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Divider(),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: ListView(
                      children: <Widget>[
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: viewModel.promotions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Container(
                                height: 300,
                                child: Padding(
                                  padding:  EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 50,
                                                child: Image.network(viewModel.promotions[index].icon)),
                                            Text(viewModel.promotions[index].title,
                                            style: TextStyle(fontSize: 18))
                                          ],
                                        ),
                                      ),
                                      Text(viewModel.promotions[index].subtitle),
                                      Text(viewModel.promotions[index].features)
                                    ],
                                  ),
                                ),
                              )
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
