import 'package:business_banking/features/offers/api/offers_service_response.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class OffersService
    extends EitherService<JsonRequestModel, OffersServiceResponseModel> {
  OffersService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'offers');

  @override
  OffersServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return OffersServiceResponseModel.fromJson(jsonResponse);
  }
}
