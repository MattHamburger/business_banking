import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class CheckDepositToAccountResponseModel extends Equatable implements JsonResponseModel {
  final List<String> toAccounts;

  CheckDepositToAccountResponseModel.fromJson(Map<String, dynamic> json)
      :
        toAccounts = List.from(json['toAccounts']) ?? new List();

  @override
  List<Object> get props => [toAccounts];
}