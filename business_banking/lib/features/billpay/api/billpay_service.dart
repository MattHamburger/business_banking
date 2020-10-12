import 'package:business_banking/features/billpay/api/billpay_request_model.dart';
import 'package:business_banking/features/billpay/api/billpay_service_response_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class BillPayService
    extends EitherService<BillPayRequestModel, BillPayServiceResponseModel> {
  BillPayService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'bill-pay/{amount}',
        );

  @override
  BillPayServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return BillPayServiceResponseModel.fromJson(jsonResponse);
  }
}
