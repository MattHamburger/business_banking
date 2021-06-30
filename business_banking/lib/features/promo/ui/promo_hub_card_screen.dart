import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import 'package:business_banking/routes.dart';

class PromoHubCardScreen extends Screen {
  final PromoHubCardViewModel viewModel;
  final PromoHubCardPresenterActions actions;

  PromoHubCardScreen({
    required this.viewModel,
    required this.actions
  });

  final _form = GlobalKey<FormState>();
  final _incomeTextEditingController = TextEditingController();
  final _phoneTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _incomeTextEditingController.text = viewModel.income;
    _phoneTextEditingController.text = viewModel.phone;

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
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                              //TODO: pass viewmodel values:
                              //viewModel!.promoValue,
                              'Offers crafted just for you!',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        )),
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.network(
                            //TODO: add promoImage
                            //viewModel!.promoIconImage
                            'https://www.huntington.com/-/media/hcom/fp2/trophy_tout_dark_green_50x50.png?rev=5435bf87f28642feb4f6f88dc7a2da39&h=50&w=50&la=en&hash=B7BE7E5D43653CFEED77995A76C8A9DB',
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  child: customTextField(
                      hintText: 'Yearly income',
                      icon: Icon(Icons.account_balance_wallet),
                      key: Key('income_key'),
                      controller: _incomeTextEditingController,
                      inputStatus: viewModel.incomeFieldStatus,
                      onSaved: (value) {
                          actions.onUpdateIncome(value!);
                      }),

                ),
                SizedBox(
                  child: customTextField(
                    hintText: 'Phone',
                    key: Key('phone_key'),
                    controller: _phoneTextEditingController,
                      inputStatus: viewModel.phoneFieldStatus,
                    icon: Icon(Icons.phone_android),
                      onSaved: (value) {
                        actions.onUpdatePhone(value!);
                    }),
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
                      //_form.currentState!.save();
                      actions.navigateToCatalogRoute(context);
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

  Widget customTextField({
    TextEditingController? controller,
    String? labelText,
    String hintText = '',
    Icon? icon,
    final FormFieldSetter<String>? onSaved,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    final String? inputStatus,
    List<TextInputFormatter>? inputFormatters,
    Key? key,
  }) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          key: key,
          controller: controller,
          inputFormatters: inputFormatters ?? <TextInputFormatter>[],
          //viewModel.paymentValueTextEditingController,
          decoration: InputDecoration(
              icon: icon,
              border: OutlineInputBorder(),
              suffixStyle: TextStyle(color: Colors.orangeAccent),
              labelText: labelText,
              hintText: hintText),

          textInputAction: TextInputAction.done,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onSaved: onSaved,
        ),
      ),
      checkInputStatus(inputStatus),
    ]);
  }

  Widget checkInputStatus(
      String? inputStatus,
      ) {
    if (inputStatus!.isNotEmpty) {
      return Padding(
          padding: EdgeInsets.only(left: 15, bottom: 10),
          child: Row(children: [
            Expanded(
                child: Text(
                  inputStatus,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                )),
          ]));
    } else {
      return Container();
    }
  }
}
