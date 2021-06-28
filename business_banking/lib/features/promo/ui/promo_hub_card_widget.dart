import 'package:business_banking/features/promo/api/promo_hub_card_service.dart';
import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/ui/promo_hub_card_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';

class PromoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromoBloc>(
      create: (_) => PromoBloc(promoService: PromoHubCardService()),
      child: PromoHubCardPresenter(),
    );
  }
}
