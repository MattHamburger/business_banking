import 'package:business_banking/features/todo/bloc/todo_service_adapter.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoUseCase extends UseCase {
  Function(ViewModel) _viewModelCallback;
  RepositoryScope _scope;

  TodoUseCase(Function(ViewModel) viewModelCallback)
      : assert(viewModelCallback != null),
        _viewModelCallback = viewModelCallback;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<TodoEntity>();
    if (_scope == null) {
      _scope = ExampleLocator()
          .repository
          .create<TodoEntity>(TodoEntity(), _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, TodoServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  TodoViewModel buildViewModel(
    TodoEntity todoListEntityModel,
  ) {
    return TodoViewModel(
      count: todoListEntityModel.count,
    );
  }
}