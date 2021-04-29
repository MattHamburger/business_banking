import 'package:business_banking/features/todo_list/model/todo_list_view_model.dart';
import 'package:business_banking/features/todo_list/model/todo_task_entity.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoListServiceResponseModel extends JsonResponseModel {
  final List<TodoTaskEntity> allTodoTasks ;
  TodoListServiceResponseModel.fromJson(Map<String, dynamic> json)
      :allTodoTasks = (json["todoTasks"] as List)
      .map((i) => new TodoTaskEntity.fromJson(i))
      .toList();

  @override
  List<Object?> get props => [allTodoTasks];
}