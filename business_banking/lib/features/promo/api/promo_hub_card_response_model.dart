import 'package:business_banking/features/promo/model/promo_catalog/promo_catalog_viewmodel.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class PromoResponseModel extends JsonResponseModel {
  final List<PromoCatalogItem> promotions;

  PromoResponseModel(this.promotions);

  PromoResponseModel.fromJson(Map<String, dynamic> json)
      : promotions = (json['promotions'] as List)
      .map((promotion) => PromoCatalogItem.fromJson(promotion))
      .toList();

  @override
  List<Object?> get props => [promotions];
}
