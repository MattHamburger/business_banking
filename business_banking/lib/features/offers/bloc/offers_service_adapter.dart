import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../api/offers_service_response.dart';
import '../api/offers_service.dart';
import '../model/offers_entity.dart';

class OffersServiceAdapter extends ServiceAdapter<OffersEntity,
    JsonRequestModel, OffersServiceResponseModel, OffersService> {
  OffersServiceAdapter() : super(OffersService());

  @override
  OffersEntity createEntity(
    OffersEntity initialEntity,
    OffersServiceResponseModel responseModel,
  ) {
    final OffersEntity entity = initialEntity.merge(
      offers: responseModel.offers,
    );
    return entity;
  }
}
