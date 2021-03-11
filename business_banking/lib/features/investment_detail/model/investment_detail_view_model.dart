//package
import 'package:clean_framework/clean_framework.dart';
import 'package:meta/meta.dart';
//internal
import 'stock_contribution_model.dart';

class InvestmentDetailViewModel extends ViewModel {
  final double accountBalance;
  final double totalGainValue;
  final double totalGainPercent;
  final List<StockContributionModel> investments;

  InvestmentDetailViewModel({
    @required this.accountBalance,
    @required this.totalGainValue,
    @required this.totalGainPercent,
    @required this.investments,
  });

  @override
  List<Object> get props =>
      [accountBalance, totalGainValue, totalGainPercent, investments];
}
