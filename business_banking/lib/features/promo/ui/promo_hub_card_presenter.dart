import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_event.dart';
import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_screen.dart';
import 'package:business_banking/routes.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';

class PromoHubCardPresenter
    extends Presenter<PromoBloc, PromoHubCardViewModel, PromoHubCardScreen> {

  @override
  Stream<PromoHubCardViewModel> getViewModelStream(PromoBloc bloc) {
    return bloc.promoHubCardViewModelPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return CircularProgressIndicator(
      key: Key('loadingIndicator'),
    );
  }

  @override
  PromoHubCardScreen buildScreen(
      BuildContext context, PromoBloc bloc, PromoHubCardViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      print('building');

      if (viewModel.serviceResponseStatus ==
          PromoServiceResponseStatus.succeed) {
        return;
      } else if (viewModel.serviceResponseStatus ==
          PromoServiceResponseStatus.failed) {
        PromoHubCardPresenterActions(bloc)
            .showDialogWithMessage(context, "Errors!", 'Submission failed');
      }
    });

    return PromoHubCardScreen(
      viewModel: viewModel,
      actions: PromoHubCardPresenterActions(bloc),
    );
  }
}

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
