import 'package:business_banking/features/advertisement/api/ad_service.dart';
import 'package:business_banking/features/advertisement/api/ad_service_request_model.dart';
import 'package:business_banking/features/advertisement/api/ad_service_response_model.dart';
import 'package:business_banking/features/advertisement/model/ad_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class AdHubCardServiceAdapter extends ServiceAdapter<AdEntity,
    AdServiceRequestModel, AdServiceResponseModel, AdService> {
  AdHubCardServiceAdapter() : super(AdService());

  @override
  AdEntity createEntity(
      AdEntity adEntity, AdServiceResponseModel responseModel) {
    return adEntity.merge(
        id: responseModel.id,
        adTitle: responseModel.adTitle,
        adDescription: responseModel.adDescription,
        adImage: responseModel.adImage,
        adIconImage: responseModel.adIconImage) as AdEntity;
  }
}
