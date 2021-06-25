import 'package:clean_framework/clean_framework.dart';

class PromoEntity extends Entity {
  final String id;
  final String title;
  final String subtitle;
  final String features;
  final String icon;

  PromoEntity(
      {
        List<EntityFailure> errors = const [],
        String? id,
        String? title,
        String? subtitle,
        String? features,
        String? icon})
      : id = id ?? '',
        title = title ?? '',
        subtitle = subtitle ?? '',
        features = features ?? '',
        icon = icon ?? '',
        super(errors: errors);

  @override
  List<Object> get props =>
      [errors, id, title, subtitle, features, icon];

  @override
  merge(
      {errors,
        String? id,
        String? title,
        String? subtitle,
        String? features,
        String? icon}) {
    return PromoEntity(
        errors: errors ?? this.errors,
        id: id ?? this.id,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        features: features ?? this.features,
        icon: icon ?? this.icon);
  }
}
