import 'package:clean_framework/clean_framework_defaults.dart';

class TodoDetailsRequestModel extends JsonRequestModel {
  final int id;

  TodoDetailsRequestModel(this.id);
  @override
  Map<String, dynamic> toJson() => {'id': this.id};
}
