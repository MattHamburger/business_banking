import 'package:clean_framework/clean_framework.dart';

class BudgetViewModel extends ViewModel {
  final String title;
  final double amount;

  BudgetViewModel({this.title, this.amount})
      : assert(title != null && amount != null);

  // @override
  List<Object> get props => [title, amount];
}
