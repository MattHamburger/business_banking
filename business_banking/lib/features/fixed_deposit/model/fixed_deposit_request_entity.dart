import 'package:clean_framework/clean_framework.dart';

class FixedDepositRequestEntity extends Entity {
  final num depositAmount;
  final int tenure;
  final double interestRate;
  final String emailAddress;
  final String nomineeName;
  final String remarks;

  FixedDepositRequestEntity({
    List<EntityFailure> errors = const [],
    this.depositAmount = 0.00,
    this.tenure = 0,
    this.interestRate = 0,
    this.emailAddress = "",
    this.nomineeName = "",
    this.remarks = "",
  });

  @override
  List<Object?> get props =>
      [depositAmount, tenure, interestRate, emailAddress, nomineeName, remarks];

  @override
  FixedDepositRequestEntity merge({
    errors,
    num? depositAmount,
    int? tenure,
    double? interestRate,
    String? emailAddress,
    String? nomineeName,
    String? remarks,
  }) {
    return FixedDepositRequestEntity(
        errors: errors ?? this.errors,
        depositAmount: depositAmount ?? this.depositAmount,
        tenure: tenure ?? this.tenure,
        interestRate: interestRate ?? this.interestRate,
        emailAddress: emailAddress ?? this.emailAddress,
        nomineeName: nomineeName ?? this.nomineeName,
        remarks: remarks ?? this.remarks);
  }
}
