import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class PromoHubCardPresenterActions {
  final PromoBloc bloc;
  PromoHubCardPresenterActions(this.bloc);

  void onGetOffersTap(
      BuildContext context,
      {
        required String phone,
        required String income,
      }) {
    String phoneValidated = bloc.validatePhone(phone);
    String incomeValidated = bloc.validateIncome(income);

    if (phoneValidated.isNotEmpty || incomeValidated.isNotEmpty) {
      showDialogWithMessage(context, 'Incorrect input', 'Correct your info');
      return;
    } else {
      navigateToCatalogRoute(context);
    }
  }

  void navigateToCatalogRoute(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.promoCatalogRoute);
  }

  void onUpdateIncome(String income) {
    final event = UpdateIncomeEvent(income);
    bloc.promoHubCardEventsPipe.send(event);
  }

  void onUpdatePhone(String phone) {
    final event = UpdatePhoneEvent(phone);
    bloc.promoHubCardEventsPipe.send(event);
  }

  void showDialogWithMessage(
      BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}
