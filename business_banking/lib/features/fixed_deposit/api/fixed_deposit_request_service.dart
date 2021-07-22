import 'package:business_banking/features/fixed_deposit/api/fixed_deposit_request_request_model.dart';
import 'package:business_banking/features/fixed_deposit/api/fixed_deposit_request_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class FixedDepositRequestService extends EitherService<
    FixedDepositRequestRequestModel, FixedDepositRequestResponseModel> {
  FixedDepositRequestService()
      : super(
            method: RestMethod.post,
            restApi: ExampleLocator().simpleApi,
            path: 'fixed-deposit');

  @override
  FixedDepositRequestResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    print(jsonResponse);
    return FixedDepositRequestResponseModel.fromJson(jsonResponse);
  }
}
