import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_post_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'bill_pay_post_request_model.dart';

class BillPayPostService
    extends EitherService<BillPayPostRequestModel, BillPayPostResponseModel> {
  BillPayPostService()
      : super(
      method: RestMethod.post,
      restApi: ExampleLocator().api,
      path: 'pay-bill');

  @override
  BillPayPostResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return BillPayPostResponseModel.fromJson(jsonResponse);
  }
}