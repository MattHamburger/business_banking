import 'package:clean_framework/clean_framework_defaults.dart';

class ReferalRequestModel extends JsonRequestModel {
  final String email;

  ReferalRequestModel({
    required this.email,
  });

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
    };
  }
}
