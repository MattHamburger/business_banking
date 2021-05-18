import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayPostResponseModel extends JsonResponseModel {
  final String status;
  final bool didSucceed;
  final String referenceNumber;

  BillPayPostResponseModel.fromJson(Map<String, dynamic> json)
      : status = json["status"] ?? '',
        didSucceed = json["didSucceed"] ?? false,
        referenceNumber = json["referenceNumber"] ?? '';

  @override
  List<Object?> get props => [status, didSucceed, referenceNumber];
}
