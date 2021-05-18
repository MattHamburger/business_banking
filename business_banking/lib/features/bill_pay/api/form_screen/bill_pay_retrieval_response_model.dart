import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BillPayRetrievalResponseModel extends JsonResponseModel {
  final List<Bill> allBills;

  BillPayRetrievalResponseModel.fromJson(Map<String, dynamic> json)
      : allBills = (json["bills"] as List)
      .map((i) => new Bill.fromJson(i))
      .toList();

  @override
  List<Object?> get props => [allBills];
}
