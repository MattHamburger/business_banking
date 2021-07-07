import 'package:business_banking/features/promo/model/promo_catalog/promo_catalog_viewmodel.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class PromoResponseModel extends Equatable implements JsonResponseModel {
  final List<PromoCatalogItem> promotions;

  PromoResponseModel(this.promotions);

  PromoResponseModel.fromJson(Map<String, dynamic> json)
      : promotions = (json['promotions'] as List)
      .map((promotion) => PromoCatalogItem.fromJson(promotion))
      .toList();

  @override
  List<Object?> get props => [promotions];

  @override
  bool get stringify => true;
}
