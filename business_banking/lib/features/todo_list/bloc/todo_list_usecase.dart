import 'package:business_banking/features/todo_list/bloc/todo_list_service_adapter.dart';
import 'package:business_banking/features/todo_list/model/todo_list_entity.dart';
import 'package:business_banking/features/todo_list/model/todo_list_view_model.dart';
import 'package:business_banking/features/todo_list/model/todo_task_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';

class TodoListUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallback;
  TodoListUseCase(ViewModelCallback<ViewModel> viewModelCallback)
      : _viewModelCallback = viewModelCallback;

  void create() async {
    final scope = ExampleLocator()
        .repository
        .create<TodoListEntity>(TodoListEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, TodoListServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  TodoListViewModel buildViewModel(
    TodoListEntity todoListEntityModel,
  ) {

    return TodoListViewModel(
      allTodoTasks: todoListEntityModel.allTodoTasks );
  }
}
