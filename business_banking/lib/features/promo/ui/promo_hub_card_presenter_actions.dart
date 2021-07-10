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
      }) async {

    Map<String, String> formValidated = bloc.validateForm(income, phone);


    if (formValidated['income']!.isNotEmpty
        || formValidated['phone']!.isNotEmpty) {
      showDialogWithMessage(context, 'Incorrect input',
          'Please correct entries');
      return;
    } else {
      await onSubmitForm();
      navigateToCatalogRoute(context);
    }
  }

  onSubmitForm(){
    bloc.onSubmitForm();
  }

  void navigateToCatalogRoute(BuildContext context) {
    CFRouterScope.of(context).push(BusinessBankingRouter.promoCatalogRoute);
  }

  void onUpdateInput(String income, String phone) {
    final event = UpdateFormEvent(income, phone);
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
