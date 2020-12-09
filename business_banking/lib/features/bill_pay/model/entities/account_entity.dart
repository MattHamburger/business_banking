import 'package:clean_framework/clean_framework.dart';

class AccountEntity extends Entity {
  final String accountTitle;
  final String accountNumber;
  final double accountBalance;
  final String accountStatus;

  AccountEntity({
    List<EntityFailure> errors = const [],
    this.accountTitle = "Account",
    this.accountNumber = "00000",
    this.accountBalance = 0.00,
    this.accountStatus = "Unknown",
  }) : super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        accountTitle,
        accountNumber,
        accountBalance,
    accountStatus,
      ];

  @override
  merge({
    errors,
    String accountTitle,
    String accountNumber,
    double accountBalance,
    String status,
  }) {
    return AccountEntity(
      errors: errors ?? this.errors,
      accountTitle: accountTitle ?? this.accountTitle,
      accountNumber: accountNumber ?? this.accountNumber,
      accountBalance: accountBalance ?? this.accountBalance,
      accountStatus: status ?? this.accountStatus,
    );
  }

  @override
  String toString() {
    return "$accountTitle $accountNumber $accountBalance $accountStatus";
  }
}
