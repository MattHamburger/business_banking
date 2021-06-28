import 'package:business_banking/features/promo/model/promo_catalog/promo_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoCatalogViewModel extends ViewModel {
  final List<PromoEntity> promoList;

  PromoCatalogViewModel({required this.promoList});

  @override
  List<Object> get props => [this.promoList];
}