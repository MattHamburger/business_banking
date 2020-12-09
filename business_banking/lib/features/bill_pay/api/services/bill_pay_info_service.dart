
import 'package:business_banking/features/bill_pay/api/models/bill_pay_info_response_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class BillPayInfoService extends EitherService<JsonRequestModel, BillPayInfoResponseModel> {
  BillPayInfoService() : super(
      method: RestMethod.get,
      restApi: ExampleLocator().api,
      path: 'bill-pay-info'
  );

  @override
  BillPayInfoResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return BillPayInfoResponseModel.fromJson(jsonResponse);
  }
}