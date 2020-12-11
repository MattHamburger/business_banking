import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class BudgetServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final List budgetsList;

  BudgetServiceResponseModel.fromJson(Map<String, dynamic> json)
      : budgetsList = json['budgets'].map((budgetsJSONObject) {
          return {
            "title": budgetsJSONObject['title'],
            "amount": budgetsJSONObject['amount']
          };
        }).toList();

  @override
  List<Object> get props => [budgetsList];
}
