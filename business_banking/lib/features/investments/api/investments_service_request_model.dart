import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class InvestmentsServiceRequestModel extends Equatable
    implements JsonRequestModel {
  final String? symbol;

  InvestmentsServiceRequestModel({required this.symbol});

  @override
  List<Object?> get props => [symbol];

  @override
  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
    };
  }
}
