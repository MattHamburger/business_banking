import 'package:business_banking/features/promo/api/promo_hub_card_request_model.dart';
import 'package:business_banking/features/promo/api/promo_hub_card_response_model.dart';
import 'package:business_banking/features/promo/api/promo_hub_card_service.dart';
import 'package:business_banking/features/promo/model/promo_hub_card_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoHubCardServiceAdapter extends ServiceAdapter<PromoHubCardEntity,
    PromoHubCardRequestModel, PromoHubCardResponseModel, PromoHubCardService> {
  PromoHubCardServiceAdapter() : super(PromoHubCardService());

  @override
  PromoHubCardEntity createEntity(PromoHubCardEntity entity,
      PromoHubCardResponseModel responseModel) {
    return entity.merge(
        income: entity.income,
        icon:entity.icon,
        phone: entity.phone) as PromoHubCardEntity;
  }
}
