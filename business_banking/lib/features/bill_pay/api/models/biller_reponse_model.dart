import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class BillerResponseModel extends Equatable implements JsonResponseModel {
  final String billerName;
  final String accountNumber;

  BillerResponseModel.fromJson(Map<String, dynamic> json)
      : billerName = json["biller_name"] ?? "Company",
        accountNumber = json["account_number"] ?? "0000";

  @override
  List<Object> get props => [
    billerName,
    accountNumber,
  ];
}
