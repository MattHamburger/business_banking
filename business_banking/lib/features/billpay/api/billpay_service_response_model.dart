import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class BillPayServiceResponseModel extends Equatable
    implements JsonResponseModel {
  //
  final bool succeeded;

  BillPayServiceResponseModel.fromJson(Map<String, dynamic> json)
      : succeeded = true;

  @override
  List<Object> get props => [succeeded];
}
