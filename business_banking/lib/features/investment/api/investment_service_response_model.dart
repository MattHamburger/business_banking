//package
import 'package:clean_framework/clean_framework_defaults.dart';

class InvestmentServiceResponseModel extends JsonResponseModel {
  final double accountBalance;
  final double totalGainValue;
  final double totalGainPercent;

  InvestmentServiceResponseModel.fromJson(Map<String, dynamic> json)
      : accountBalance = json['accountBalance'] ?? 0.00,
        totalGainValue = json['totalGainValue'] ?? 0.00,
        totalGainPercent = json['totalGainPercent'] ?? 0.00;

  @override
  List<Object> get props => [accountBalance, totalGainValue, totalGainPercent];
}
