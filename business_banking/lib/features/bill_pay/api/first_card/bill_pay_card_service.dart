import 'package:business_banking/features/bill_pay/api/first_card/bill_pay_card_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayCardService
    extends EitherService<JsonRequestModel, BillPayCardResponseModel> {
  BillPayCardService()
      : super(
      method: RestMethod.get,
      restApi: ExampleLocator().api,
      path: 'bills');

  @override
  BillPayCardResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return BillPayCardResponseModel.fromJson(jsonResponse);
  }
}
