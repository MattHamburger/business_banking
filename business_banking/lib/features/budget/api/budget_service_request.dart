import 'package:clean_framework/clean_framework_defaults.dart';

class BudgetServiceRequestModel extends JsonRequestModel {
  final String title;
  final double amount;

  BudgetServiceRequestModel({this.title, this.amount});

  @override
  Map<String, dynamic> toJson() {
    return {"title": title, "amount": amount};
  }
}
