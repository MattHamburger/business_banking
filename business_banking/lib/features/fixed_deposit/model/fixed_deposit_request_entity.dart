import 'package:clean_framework/clean_framework.dart';

class FixedDepositRequestEntity extends Entity {
  final num depositAmount;
  final int tenure;
  final double interestRate;
  final String emailAddress;
  final String nomineeName;
  final String remarks;
  final bool success;

  FixedDepositRequestEntity({
    List<EntityFailure> errors = const [],
    this.depositAmount = 0.00,
    this.tenure = 0,
    this.interestRate = 0,
    this.emailAddress = "",
    this.nomineeName = "",
    this.remarks = "",
    this.success = false,
  });

  @override
  List<Object?> get props => [
        depositAmount,
        tenure,
        interestRate,
        emailAddress,
        nomineeName,
        remarks,
        success
      ];

  @override
  FixedDepositRequestEntity merge({
    errors,
    num? depositAmount,
    int? tenure,
    double? interestRate,
    String? emailAddress,
    String? nomineeName,
    String? remarks,
    bool? success,
  }) {
    return FixedDepositRequestEntity(
      errors: errors ?? this.errors,
      depositAmount: depositAmount ?? this.depositAmount,
      tenure: tenure ?? this.tenure,
      interestRate: interestRate ?? this.interestRate,
      emailAddress: emailAddress ?? this.emailAddress,
      nomineeName: nomineeName ?? this.nomineeName,
      remarks: remarks ?? this.remarks,
      success: success ?? this.success,
    );
  }
}
