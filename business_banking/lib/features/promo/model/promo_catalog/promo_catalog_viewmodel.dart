import 'package:equatable/equatable.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoCatalogViewModel extends ViewModel {
  final List<PromoCatalogItem> promoList;

  PromoCatalogViewModel({required this.promoList});

  @override
  List<Object> get props => [this.promoList];
}

class PromoCatalogItem extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String features;
  final String icon;

  PromoCatalogItem(
      this.id, this.title, this.subtitle, this.features, this.icon);

  PromoCatalogItem.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        title = json['title'] ?? '',
        subtitle = json['subtitle'] ?? '',
        features = json['features'] ?? '',
        icon = json['icon'] ?? '';

  @override
  List<Object?> get props => [id, title, subtitle, features, icon];
}
