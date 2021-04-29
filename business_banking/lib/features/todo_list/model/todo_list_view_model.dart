import 'package:business_banking/features/todo_list/model/todo_task_entity.dart';
import 'package:clean_framework/clean_framework.dart';


class TodoListViewModel extends ViewModel {
  final List<TodoTaskEntity> allTodoTasks;

  TodoListViewModel({
    required this.allTodoTasks
  });

  @override
  List<Object> get props => [allTodoTasks];

}
