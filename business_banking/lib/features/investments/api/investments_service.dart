import 'package:business_banking/features/investments/api/investments_json_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class InvestmentsService
    extends EitherService<JsonRequestModel, InvestmentsJsonResponseModel> {
  InvestmentsService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: '/quotes/{symbol}');

  @override
  InvestmentsJsonResponseModel parseResponse(
          Map<String, dynamic> jsonResponse) =>
      InvestmentsJsonResponseModel.fromJson(jsonResponse);
}
