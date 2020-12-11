import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BudgetEntity extends Entity {
  final List<BudgetViewModel> budgetsList;

  BudgetEntity({List<EntityError> errors, List<BudgetViewModel> budgetsList})
      : budgetsList = budgetsList ?? [],
        super(errors: errors);

  @override
  List<Object> get props => [errors, budgetsList];

  @override
  merge({errors, List<BudgetViewModel> budgetsList}) {
    return BudgetEntity(
        errors: errors ?? this.errors, budgetsList: this.budgetsList);
  }
}
