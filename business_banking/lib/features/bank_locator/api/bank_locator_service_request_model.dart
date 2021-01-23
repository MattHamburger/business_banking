import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class BankLocatorServiceRequestModel extends Equatable
    implements JsonRequestModel {
  final String latitude;
  final String longitude;

  const BankLocatorServiceRequestModel({this.latitude, this.longitude});

  @override
  List<Object> get props => [latitude, longitude];

  @override
  Map<String, dynamic> toJson() =>
      {'latitude': latitude, 'longitude': longitude};
}
