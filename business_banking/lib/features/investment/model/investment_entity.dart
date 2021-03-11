// package
import 'package:clean_framework/clean_framework.dart';

class InvestmentEntity extends Entity {
  final double accountBalance;
  final double totalGainValue;
  final double totalGainPercent;

  InvestmentEntity({
    List<EntityFailure> errors = const [],
    this.accountBalance = 0.00,
    this.totalGainValue = 0.00,
    this.totalGainPercent = 0.00,
  }) : super(errors: errors);

  @override
  List<Object> get props =>
      [errors, accountBalance, totalGainValue, totalGainPercent];

  @override
  merge(
      {errors,
      double accountBalance,
      double totalGainValue,
      double totalGainPercent}) {
    return InvestmentEntity(
      errors: errors ?? this.errors,
      accountBalance: accountBalance ?? this.accountBalance,
      totalGainValue: totalGainValue ?? this.totalGainValue,
      totalGainPercent: totalGainPercent ?? this.totalGainPercent,
    );
  }
}
