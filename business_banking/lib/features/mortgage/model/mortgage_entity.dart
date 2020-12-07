import 'package:clean_framework/clean_framework.dart';

class MortgageEntity extends Entity {
  final int monthlyPaymentDue;
  final double monthlyAmountDue;
  final double outstandingPrincipal;
  final double interestRate;
  final double escrowBalance;
  final double feesCharged;
  final int loanNumber;

  MortgageEntity({
    List<EntityFailure> errors = const [],
    int monthlyPaymentDue,
    double monthlyAmountDue,
    double outstandingPrincipal,
    double interestRate,
    double escrowBalance,
    double feesCharged,
    int loanNumber,
  })  : monthlyPaymentDue = monthlyPaymentDue ?? 1607352890,
        monthlyAmountDue = monthlyAmountDue ?? 0.00,
        outstandingPrincipal = outstandingPrincipal ?? 0.00,
        interestRate = interestRate ?? 0.00,
        escrowBalance = escrowBalance ?? 0.00,
        feesCharged = feesCharged ?? 0.00,
        loanNumber = loanNumber ?? 0000,
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        monthlyAmountDue,
        monthlyPaymentDue,
        outstandingPrincipal,
        interestRate
      ];

  @override
  merge({
    errors,
    DateTime monthlyPaymentDue,
    double monthlyAmountDue,
    double outstandingPrincipal,
    double intrestRate,
  }) {
    return MortgageEntity(
      errors: errors ?? this.errors,
      monthlyPaymentDue: monthlyPaymentDue ?? this.monthlyPaymentDue,
      outstandingPrincipal: outstandingPrincipal ?? this.outstandingPrincipal,
      monthlyAmountDue: monthlyAmountDue ?? this.monthlyAmountDue,
    );
  }
}
