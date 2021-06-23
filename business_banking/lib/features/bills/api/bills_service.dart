import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'bills_service_response_model.dart';

class BillsService extends EitherService<JsonRequestModel, BillsServiceResponseModel> {
  BillsService()
        : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'bills'
  );
  
  @override
  BillsServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return BillsServiceResponseModel.fromJson(jsonResponse);
  }
}