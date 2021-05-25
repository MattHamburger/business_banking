import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class AdDetailsScreen extends Screen {
  final AdHubCardViewModel? viewModel;

  AdDetailsScreen({this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          viewModel!.adTitle,
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Card(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 20.0),
                child: Center(
                    child: Text(viewModel!.adTitle,
                        style: TextStyle(fontSize: 24))),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 18.0, horizontal: 20.0),
                child: Center(
                  child: Image.network(viewModel!.adImage),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: Image.network(viewModel!.adIconImage)),
                    Expanded(child: Text(viewModel!.adDescription)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
