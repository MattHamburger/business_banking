import 'dart:io';

import 'package:business_banking/features/mobile_check_deposit/api/check_deposit_request_model.dart';
import 'package:business_banking/features/mobile_check_deposit/api/check_deposit_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CheckDepositService extends EitherService<CheckDepositRequestModel,
    CheckDepositResponseModel> {
  CheckDepositService()
      : super(
      method: RestMethod.post,
      restApi: ExampleLocator().api,
      path: 'submit-deposit'
  );

  @override
  CheckDepositResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
        stderr.writeln("parseResponse: " + jsonResponse.toString());
    return CheckDepositResponseModel.fromJson(jsonResponse);
  }
}