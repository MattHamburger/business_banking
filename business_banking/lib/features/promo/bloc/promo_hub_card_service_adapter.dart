import 'package:business_banking/features/promo/api/promo_hub_card_request_model.dart';
import 'package:business_banking/features/promo/api/promo_hub_card_response_model.dart';
import 'package:business_banking/features/promo/api/promo_hub_card_service.dart';
import 'package:business_banking/features/promo/model/promo_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class PromoHubCardServiceAdapter extends ServiceAdapter<
    PromoEntity,
    PromoRequestModel,
    PromoResponseModel,
    PromoHubCardService> {
  PromoHubCardServiceAdapter()
      : super(PromoHubCardService());

  @override
  PromoEntity createEntity(PromoEntity initialEntity, PromoResponseModel responseModel) {
    return initialEntity.merge(
      errors: <EntityFailure>[],
      promotions: responseModel.promotions,
    ) as PromoEntity;
  }

  @override
  PromoRequestModel createRequest(
      PromoEntity entity) {
    return PromoRequestModel(
        phone: entity.phone,
        income: entity.phone
    );
  }
}
