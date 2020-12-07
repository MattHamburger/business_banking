import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class MortgageServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final int monthlyPaymentDue;
  final double monthlyAmountDue;
  final double outstandingPrincipal;
  final double interestRate;
  final double escrowBalance;
  final double feesCharged;
  final int loanNumber;

  MortgageServiceResponseModel.fromJson(Map<String, dynamic> json)
      : monthlyPaymentDue = json['monthly_payment_due'] ?? 1607352890,
        monthlyAmountDue = json['monthly_amount_due'] ?? 0.00,
        outstandingPrincipal = json['outstanding_principal'] ?? 0.00,
        interestRate = json['interest_rate'] ?? 0.00,
        escrowBalance = json['escrow_balance'] ?? 0.00,
        feesCharged = json['fees_charged'] ?? 0.00,
        loanNumber = json['loan_number'] ?? 0;
  @override
  List<Object> get props => [
        monthlyPaymentDue,
        monthlyAmountDue,
        outstandingPrincipal,
        interestRate,
        escrowBalance,
        feesCharged,
        loanNumber
      ];
}
