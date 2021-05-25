import 'package:clean_framework/clean_framework_defaults.dart';

class AdServiceRequestModel implements JsonRequestModel {
  final String id;

  AdServiceRequestModel({required this.id});

  @override
  Map<String, dynamic> toJson() {
    return {'id': id};
  }
}
