// package
import 'package:clean_framework/clean_framework.dart';
import 'package:meta/meta.dart';

class InvestmentViewModel extends ViewModel {
  final double accountBalance;
  final double totalGainValue;
  final double totalGainPercent;

  InvestmentViewModel({
    @required this.accountBalance,
    @required this.totalGainValue,
    @required this.totalGainPercent,
  });

  @override
  List<Object> get props => [accountBalance, totalGainValue, totalGainPercent];
}
