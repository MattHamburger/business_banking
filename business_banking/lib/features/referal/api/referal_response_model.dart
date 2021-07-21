import 'package:clean_framework/clean_framework_defaults.dart';

class ReferalResponeModel extends JsonResponseModel {
  final String confirmationId;

  ReferalResponeModel.fromJson(Map<String, dynamic> json)
      : confirmationId = json['confirmationId'];

  @override
  List<Object?> get props => [confirmationId];
}
