import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/model/promo_enums.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_view_model.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter_actions.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_screen.dart';
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
      BuildContext context,
      PromoBloc bloc,
      PromoHubCardViewModel viewModel) {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {

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
