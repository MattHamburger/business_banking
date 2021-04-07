import 'package:business_banking/features/todo/bloc/todo_service_adapter.dart';
import 'package:business_banking/features/todo/model/todo_entity_model_list.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:business_banking/features/todo/model/todo_view_model_list.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoUsecase extends UseCase {
  Function(TodoViewModelList) _viewmodelCallback;
  RepositoryScope _scope;

  TodoUsecase(this._viewmodelCallback) : assert(_viewmodelCallback != null);

  Future create() async {
    _scope = ExampleLocator().repository.containsScope<TodoEntityModelList>();
    if (_scope == null) {
      _scope = ExampleLocator().repository.create<TodoEntityModelList>(
          TodoEntityModelList(), _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }
    final adapter = TodoServiceAdapter();

    await ExampleLocator().repository.runServiceAdapter(_scope, adapter);
  }

  dynamic _notifySubscribers(entity) {
    _viewmodelCallback(buildViewModel(entity));
  }

  TodoViewModelList buildViewModel(TodoEntityModelList entity) {
    return TodoViewModelList(
      entity.entities
          .map((e) => TodoViewModel(name: e.title, id: e.id))
          .toList(),
    );
  }
}
