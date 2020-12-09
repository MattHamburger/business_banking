import 'package:business_banking/features/bill_pay/model/entities/biller_entity.dart';
import 'package:business_banking/features/bill_pay/model/entities/rules_entity.dart';
import 'package:clean_framework/clean_framework.dart';

import 'account_entity.dart';

class BillPayInfoEntity extends Entity {
  final List<AccountEntity> accounts;
  final List<BillerEntity> billers;
  final RulesEntity rules;

  BillPayInfoEntity({
    List<EntityFailure> errors = const [],
    List<AccountEntity> accounts,
    List<BillerEntity> billers,
    RulesEntity rules,
  })
      : accounts = accounts ?? List<AccountEntity>(),
        billers = billers ?? List<BillerEntity>(),
        rules = rules ?? RulesEntity(),
        super(errors: errors);

  @override
  List<Object> get props => [errors, accounts, billers, rules,];

  @override
  merge({errors, List<AccountEntity> accounts, List<
      BillerEntity> billers, RulesEntity rules,}) {
    return BillPayInfoEntity(
        errors: errors ?? this.errors,
        accounts: accounts ?? this.accounts,
        billers:  billers ?? this.billers,
        rules: rules ?? this.rules,
    );
  }
  @override
  String toString() {
    return "$accounts $billers $errors";
  }
}
