import 'package:business_banking/features/promo/api/promo_hub_card_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'promo_hub_card_request_model.dart';

class PromoHubCardService
    extends EitherService<PromoHubCardRequestModel, PromoHubCardResponseModel> {
  PromoHubCardService()
      : super(
      method: RestMethod.get, restApi: ExampleLocator().api, path: "promo");

  @override
  PromoHubCardResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return PromoHubCardResponseModel.fromJson(jsonResponse);
  }
}
