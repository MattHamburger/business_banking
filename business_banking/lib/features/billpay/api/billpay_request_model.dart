import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class BillPayRequestModel extends Equatable implements JsonRequestModel {
  final double amount;

  BillPayRequestModel({this.amount});

  @override
  Map<String, dynamic> toJson() {
    return {'amount': amount};
  }

  @override
  List<Object> get props => [amount];
}
