import 'package:business_banking/features/promo/model/promo_catalog/promo_catalog_viewmodel.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoEntity extends Entity {
  final String income;
  final String phone;
  final String icon;
  final List<PromoCatalogItem> promotions;

  PromoEntity(
      {List<EntityFailure> errors = const [],
      String? income,
      String? phone,
      String? icon,
      List<PromoCatalogItem>? promotions}) :
        income = income ?? '',
        phone = phone ?? '',
        icon = icon ?? '',
        promotions = promotions ?? [],
        super(errors: errors);

  @override
  List<Object> get props =>
      [errors, income, phone, icon, promotions];

  @override
  merge(
      {
        errors,
        String? income,
        String? phone,
        String? icon,
        List<PromoCatalogItem>? promotions
      }) {
    return PromoEntity(
        errors: errors ?? this.errors,
        income: income ?? this.income,
        phone: phone ?? this.phone,
        icon: icon ?? this.icon,
        promotions: promotions ?? this.promotions
    );
  }
}
