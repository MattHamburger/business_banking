import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'statement_response_service_response_model.dart';

class StatementService
    extends EitherService<JsonRequestModel, StatementServiceResponseModel> {
  StatementService()
      : super(
          method: RestMethod.get,
          restApi: ExampleLocator().api,
          path: 'statements',
        );

  @override
  StatementServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return StatementServiceResponseModel.fromJson(jsonResponse);
  }
}
