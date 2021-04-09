import 'package:business_banking/features/todo/bloc/item/todo_item_service_adapter.dart';
import 'package:business_banking/features/todo/model/item/todo_item_entity.dart';
import 'package:business_banking/features/todo/model/item/todo_item_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoItemUseCase extends UseCase {
  Function(ViewModel) _viewModelCallback;
  RepositoryScope _scope;
  int _index;

  TodoItemUseCase(int index, Function(ViewModel) viewModelCallback)
      : assert(viewModelCallback != null),
        assert(index != null),
        _viewModelCallback = viewModelCallback,
        _index = index;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<TodoItemEntity>(_index);
    if (_scope == null) {
      _scope = ExampleLocator()
          .repository
          .create<TodoItemEntity>(TodoItemEntity(), _notifySubscribers, index: _index);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, TodoItemServiceAdapter(_index));
  }

  void _notifySubscribers(entity) {
    _viewModelCallback(buildViewModel(entity));
  }

  TodoItemViewModel buildViewModel(
    TodoItemEntity todoItemListEntityModel,
  ) {
    return TodoItemViewModel(
      userId: todoItemListEntityModel.userId,
      id: todoItemListEntityModel.id,
      title: todoItemListEntityModel.title,
      completed: todoItemListEntityModel.completed,
    );
  }
}