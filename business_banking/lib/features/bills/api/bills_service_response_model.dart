import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/bills/model/bills_view_model.dart';

class BillsServiceResponseModel extends JsonResponseModel {
  final List<Bill> bills;
  
  BillsServiceResponseModel.fromJson(Map<String, dynamic>json) :
    bills = (json['bills'] as List).map((e) => Bill.fromJson(e)).toList();
  
  @override
  List<Object> get props => [bills];
}