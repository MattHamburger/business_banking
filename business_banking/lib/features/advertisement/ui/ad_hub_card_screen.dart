import 'package:business_banking/features/advertisement/model/ad_hub_card_view_model.dart';
import 'package:business_banking/features/advertisement/ui/ad_hub_card_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AdHubCardScreen extends Screen {
  final AdHubCardViewModel? viewModel;
  final AdHubCardPresenterActions? actions;

  AdHubCardScreen({this.viewModel, this.actions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        key: Key('adCard'),
        color: Colors.white,
        shadowColor: Colors.grey[500],
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(viewModel!.adTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.network(viewModel!.adIconImage),
                    ))
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton(
                    key: Key('Ad-Card-Learn-More-Button'),
                    child: Text(
                      'Learn More',
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        side: BorderSide(width: 2, color: Colors.green)),
                    onPressed: () {
                      actions!.navigateToCreditCardDetails(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
