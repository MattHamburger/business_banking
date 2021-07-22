import 'package:clean_framework/clean_framework_defaults.dart';

class FixedDepositRequestResponseModel extends JsonResponseModel {
  final bool success;
  final int errorCode;

  FixedDepositRequestResponseModel.fromJson(Map<String, dynamic> json)
      : success = json['success'],
        errorCode = json['errorCode'];

  @override
  List<Object?> get props => [success, errorCode];
}
