import 'package:business_banking/features/advertisement/api/ad_service_request_model.dart';
import 'package:business_banking/features/advertisement/api/ad_service_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AdService
    extends EitherService<AdServiceRequestModel, AdServiceResponseModel> {
  AdService()
      : super(
            method: RestMethod.get, restApi: ExampleLocator().api, path: "ads");

  @override
  AdServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return AdServiceResponseModel.fromJson(jsonResponse);
  }
}
