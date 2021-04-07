import 'package:business_banking/features/todo/api/todo_response_model.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:clean_framework/clean_framework.dart';

const _l = <TodoEntity>[];

class TodoEntityModelList extends Entity {
  final List<TodoEntity> entities;

  TodoEntityModelList([this.entities = _l]);

  @override
  dynamic merge({errors, TodoResponseModel response}) {
    if (response == null) {
      return this;
    }
    return TodoEntityModelList(entities + response.todos);
  }

  @override
  List<Object> get props => <dynamic>[entities] + super.props;
}
