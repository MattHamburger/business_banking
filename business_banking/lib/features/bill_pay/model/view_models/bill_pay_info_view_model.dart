import 'package:business_banking/features/bill_pay/model/entities/account_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/biller_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/rules_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/foundation.dart';

class BillPayInfoViewModel extends Equatable implements ViewModel {
  final List<BillerEntity> billers;
  final List<AccountEntity> accounts;
  final RulesEntity rules;
  final ServiceStatus serviceStatus;
  final DataStatus dataStatus;

  BillPayInfoViewModel({
    @required this.billers,
    @required this.accounts,
    @required this.rules,
    this.serviceStatus = ServiceStatus.unknown,
    this.dataStatus = DataStatus.unknown,
  });

  @override
  List<Object> get props => [
        billers,
        accounts,
        rules,
        serviceStatus,
        dataStatus,
      ];

  @override
  String toString() {
    return "Billers: $billers, Accounts: $accounts, Rules: $rules, ServiceStatus: $serviceStatus, DataStatus: $dataStatus";
  }
}

enum ServiceStatus { success, fail, unknown }
enum DataStatus { valid, invalid, unknown }
