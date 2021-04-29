import 'package:business_banking/features/todo_list/model/todo_list_view_model.dart';
import 'package:business_banking/features/todo_list/model/todo_task_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class TodoListEntity extends Entity {
  final List<TodoTaskEntity> allTodoTasks;

  TodoListEntity({
    List<EntityFailure> errors = const [],
    List<TodoTaskEntity>? allTodoTasks,
  })  : allTodoTasks = allTodoTasks ?? [],
        super(errors: errors);

  @override
  merge({
    errors,
    List<TodoTaskEntity>? allTodoTasks,
  }) {
    return TodoListEntity(
        errors: errors ?? this.errors,
        allTodoTasks: allTodoTasks ?? this.allTodoTasks);
  }
}
