import 'package:business_banking/features/deposit_check/model/account_info_struct.dart';
import 'package:clean_framework/clean_framework.dart';

class StatementCardEntity extends Entity {
  final List<AccountInfoStruct> accounts;

  StatementCardEntity({
    List<EntityFailure> errors = const [],
    List<AccountInfoStruct> accountInfoStructs = const [],
  })  : accounts = accountInfoStructs,
        super(errors: errors);

  @override
  List<Object> get props => [errors, accounts];

  @override
  StatementCardEntity merge({
    List<EntityFailure>? errors,
    List<AccountInfoStruct> accounts = const [],
  }) {
    return StatementCardEntity(
      errors: errors ?? this.errors,
      accountInfoStructs: accounts,
    );
  }
}
