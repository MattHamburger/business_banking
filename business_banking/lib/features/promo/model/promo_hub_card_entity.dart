import 'package:clean_framework/clean_framework.dart';

class PromoHubCardEntity extends Entity {
  final String income;
  final String phone;
  final String icon;

  PromoHubCardEntity(
      {List<EntityFailure> errors = const [],
      String? income,
      String? phone,
      String? icon}) :
        income = income ?? '',
        phone = phone ?? '',
        icon = icon ?? '',
        super(errors: errors);

  @override
  List<Object> get props =>
      [errors, income, phone, icon];

  @override
  merge(
      {errors,
        String? income,
        String? phone,
        String? icon}) {
    return PromoHubCardEntity(
        errors: errors ?? this.errors,
        income: income ?? this.income,
        phone: phone ?? this.phone,
        icon: icon ?? this.icon,
    );
  }
}
