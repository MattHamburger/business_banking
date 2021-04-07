import 'package:business_banking/features/todo/bloc/todo_details/todo_details_service_adapter.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoDetailsUsecase extends UseCase {
  Function(TodoViewModel) _viewmodelCallback;
  RepositoryScope _scope;

  TodoDetailsUsecase(this._viewmodelCallback)
      : assert(_viewmodelCallback != null);

  Future create(Entity entity) async {
    _scope = ExampleLocator().repository.containsScope<TodoEntity>();
    if (_scope == null) {
      _scope = ExampleLocator()
          .repository
          .create<TodoEntity>(entity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }
    final adapter = TodoDetailsServiceAdapter();

    await ExampleLocator().repository.runServiceAdapter(_scope, adapter);
  }

  dynamic _notifySubscribers(entity) {
    _viewmodelCallback(buildViewModel(entity));
  }

  TodoViewModel buildViewModel(TodoEntity entity) {
    return TodoViewModel(name: entity.title, id: entity.id);
  }
}
