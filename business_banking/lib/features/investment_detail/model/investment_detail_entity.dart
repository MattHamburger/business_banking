//package
import 'package:clean_framework/clean_framework.dart';
//internal
import 'stock_contribution_model.dart';

class InvestmentDetailEntity extends Entity {
  final double accountBalance;
  final double totalGainValue;
  final double totalGainPercent;
  final List<StockContributionModel> investments;

  InvestmentDetailEntity({
    List<EntityFailure> errors = const [],
    this.accountBalance = 0.00,
    this.totalGainValue = 0.00,
    this.totalGainPercent = 0.00,
    this.investments = const [],
  }) : super(errors: errors);

  @override
  List<Object> get props =>
      [errors, accountBalance, totalGainValue, totalGainPercent, investments];

  @override
  merge(
      {errors,
      double accountBalance,
      double totalGainValue,
      double totalGainPercent,
      List<StockContributionModel> investments}) {
    return InvestmentDetailEntity(
      errors: errors ?? this.errors,
      accountBalance: accountBalance ?? this.accountBalance,
      totalGainValue: totalGainValue ?? this.totalGainValue,
      totalGainPercent: totalGainPercent ?? this.totalGainPercent,
      investments: investments ?? this.investments,
    );
  }
}
