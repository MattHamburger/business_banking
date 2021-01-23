import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class BankLocatorServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final List<Map<String, dynamic>> bankLocations;

  const BankLocatorServiceResponseModel(this.bankLocations);

  factory BankLocatorServiceResponseModel.fromJson(Map<String, dynamic> json) =>
      BankLocatorServiceResponseModel(json['bankLocations']);

  @override
  List<Object> get props => bankLocations;
}
