import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayPostRequestModel extends JsonRequestModel {
  final int billId;

  BillPayPostRequestModel({required this.billId});

  @override
  Map<String, dynamic> toJson() {
    return {
      'billId': billId.toString(),
    };
  }
}