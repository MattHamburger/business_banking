import 'package:business_banking/features/budget/api/budget_service_response.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BudgetService
    extends EitherService<JsonRequestModel, BudgetServiceResponseModel> {
  BudgetService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'budget-info');

  @override
  BudgetServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return BudgetServiceResponseModel.fromJson(jsonResponse);
  }
}
