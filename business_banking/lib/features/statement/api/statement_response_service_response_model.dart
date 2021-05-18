import 'package:business_banking/features/statement/model/statement.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StatementServiceResponseModel extends JsonResponseModel {
  final List<Statement> statements;

  StatementServiceResponseModel.fromJson(Map<String, dynamic> json)
      : statements = (json["statements"] as List)
            .map((i) => new Statement.fromJson(i))
            .toList();

  @override
  List<Object> get props => [statements];
}
