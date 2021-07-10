import 'package:business_banking/features/promo/bloc/promo_hub_card_bloc.dart';
import 'package:business_banking/features/promo/ui/promo_catalog/promo_catalog_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

class PromoCatalogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PromoBloc>(create: (_) => PromoBloc(), child: PromoCatalogPresenter());
  }
}
