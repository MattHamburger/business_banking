import 'package:business_banking/features/todo/api/todo_details/todo_details_request_model.dart';
import 'package:business_banking/features/todo/api/todo_details/todo_details_response_model.dart';
import 'package:business_banking/features/todo/api/todo_details/todo_details_service.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class TodoDetailsServiceAdapter extends ServiceAdapter<TodoEntity,
    TodoDetailsRequestModel, TodoDetailsResponseModel, TodoDetailsService> {
  TodoDetailsServiceAdapter() : super(TodoDetailsService());

  @override
  TodoDetailsRequestModel createRequest(TodoEntity entity) {
    return TodoDetailsRequestModel(entity.id);
  }

  @override
  TodoEntity createEntity(
    TodoEntity initialEntity,
    TodoDetailsResponseModel responseModel,
  ) =>
      TodoEntity.fromResponseModel(responseModel);

  @override
  Future<TodoEntity> query(TodoEntity initialEntity) {
    return super.query(initialEntity);
  }
}
