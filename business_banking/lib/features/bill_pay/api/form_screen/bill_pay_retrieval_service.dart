import 'package:business_banking/features/bill_pay/api/form_screen/bill_pay_retrieval_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayRetrievalService
    extends EitherService<JsonRequestModel, BillPayRetrievalResponseModel> {
  BillPayRetrievalService()
      : super(
      method: RestMethod.get,
      restApi: ExampleLocator().api,
      path: 'bills');

  @override
  BillPayRetrievalResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return BillPayRetrievalResponseModel.fromJson(jsonResponse);
  }
}