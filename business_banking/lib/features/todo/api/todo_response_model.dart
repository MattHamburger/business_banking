import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoResponseModel extends JsonResponseModel {
  final List<TodoEntity> todos;

  TodoResponseModel({this.todos});

  factory TodoResponseModel.fromJson(Map<String, dynamic> json) {
    return TodoResponseModel(
      todos: json["todos"]
          .map<TodoEntity>(
            (j) => TodoEntity(
                id: j["id"],
                title: j["title"],
                completed: j['completed'],
                userId: j['userId']),
          )
          .toList(),
    );
  }

  @override
  List<Object> get props => [todos];
}
