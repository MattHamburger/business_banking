import 'package:business_banking/features/budget/api/budget_service.dart';
import 'package:business_banking/features/budget/api/budget_service_response.dart';
import 'package:business_banking/features/budget/model/budget.entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BudgetServiceAdapter extends ServiceAdapter<BudgetEntity,
    JsonRequestModel, BudgetServiceResponseModel, BudgetService> {
  BudgetServiceAdapter() : super(BudgetService());

  @override
  BudgetEntity createEntity(
      BudgetEntity initialEntity, BudgetServiceResponseModel responseModel) {
    return initialEntity.merge(
      budgetsList: responseModel.budgetsList,
    );
  }
}
