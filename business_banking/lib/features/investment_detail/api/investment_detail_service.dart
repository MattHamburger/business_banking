// package
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
// internal
import 'investment_detail_response_model.dart';
import '../../../locator.dart';

class InvestmentDetailService extends EitherService<JsonRequestModel,
    InvestmentDetailServiceResponseModel> {
  InvestmentDetailService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'investment-details-account');

  @override
  InvestmentDetailServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return InvestmentDetailServiceResponseModel.fromJson(jsonResponse);
  }
}
