import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class TodoItemServiceResponseModel extends Equatable implements JsonResponseModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoItemServiceResponseModel.fromJson(Map<String, dynamic> json)
      : userId = json["userId"],
        id = json["id"],
        title = json["title"],
        completed = json["completed"];

  @override
  List<Object> get props => [userId, id, title, completed];
}