import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PromoHubCardScreen extends Screen {
  //TODO: implement below classes
  //final PromoHubCardViewModel? viewModel;
  //final PromoHubCardPresenterActions? actions;


  PromoHubCardScreen();
  //TODO: add to constructor:
  //this.viewModel, this.actions

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
                          child: Text(
                              //TODO: pass viewmodel values:
                              //viewModel!.promoValue,
                            'Viewmodel text!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        )),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.network(
                              //TODO: add promoImage
                              //viewModel!.promoIconImage
                              'https://www.huntington.com/-/media/hcom/fp2/no_money_tout_dark_green_50x50.png?rev=c64f89166c5548a4817f8433fec62177&h=50&w=50&la=en&hash=C35BA903EE8C32BAE6DB9D944EE778EE',
                            ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: OutlinedButton(
                    key: Key('Promo-Get-Offers-Button'),
                    child: Text(
                      'Get Offers',
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
                      //TODO: add navigation after input has been validated
                      //actions!.navigateToPromoCatalog(context);
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
