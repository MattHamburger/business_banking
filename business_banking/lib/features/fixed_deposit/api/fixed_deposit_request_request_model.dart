import 'package:clean_framework/clean_framework_defaults.dart';

class FixedDepositRequestRequestModel extends JsonRequestModel {
  final num depositAmount;
  final int tenure;
  final double interestRate;
  final String email;
  final String nomineeName;
  final String remarks;

  FixedDepositRequestRequestModel({
    required this.depositAmount,
    required this.tenure,
    required this.interestRate,
    required this.email,
    required this.nomineeName,
    required this.remarks,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'depositAmount': depositAmount,
      'tenure': tenure,
      'interestRate': interestRate,
      'email': email,
      'nomineeName': nomineeName,
      'remarks': remarks,
    };
  }
}
