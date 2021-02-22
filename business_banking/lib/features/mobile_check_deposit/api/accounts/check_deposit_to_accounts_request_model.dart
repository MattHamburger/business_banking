import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class CheckDepositToAccountsRequestModel extends Equatable
    implements JsonRequestModel {
  final String fromAccount;

  CheckDepositToAccountsRequestModel({this.fromAccount});

  @override
  Map<String, dynamic> toJson() {
    return { 'fromAccount': fromAccount };
  }

  @override
  List<Object> get props => [fromAccount];
}