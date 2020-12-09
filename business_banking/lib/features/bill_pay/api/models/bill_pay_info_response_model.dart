import 'package:business_banking/features/bill_pay/api/models/account_reponse_model.dart';
import 'package:business_banking/features/bill_pay/api/models/biller_reponse_model.dart';
import 'package:business_banking/features/bill_pay/api/models/rules_response_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class BillPayInfoResponseModel extends Equatable implements JsonResponseModel {
  final List<AccountResponseModel> accounts;
  final List<BillerResponseModel> billers;
  final RulesResponseModel rules;

  BillPayInfoResponseModel.fromJson(Map<String, dynamic> json)
      : accounts = (json["accounts"] as List)
                .map((i) => AccountResponseModel.fromJson(i))
                .toList() ??
            [],
        billers = (json["billers"] as List)
                .map((i) => BillerResponseModel.fromJson(i))
                .toList() ??
            [],
        rules = RulesResponseModel.fromJson(json["rules"] ?? {});

  @override
  List<Object> get props => [
        accounts,
        billers,
        rules,
      ];
}
