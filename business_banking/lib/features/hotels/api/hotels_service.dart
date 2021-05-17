import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'hotels_service_response_model.dart';

class HotelsService
    extends EitherService<JsonRequestModel, HotelsServiceResponseModel> {
  HotelsService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'hotels');

  @override
  HotelsServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return HotelsServiceResponseModel.fromJson(jsonResponse);
  }
}
