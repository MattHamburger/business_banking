import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TodoServiceResponseModel extends Equatable implements JsonResponseModel {
  final int count;

  TodoServiceResponseModel.fromJson(Map<String, dynamic> json)
      : count = json['todos']?.length ?? 0;

  @override
  List<Object> get props => [count];
}