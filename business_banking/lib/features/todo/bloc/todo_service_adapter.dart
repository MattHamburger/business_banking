import 'package:business_banking/features/todo/api/todo_request_model.dart';
import 'package:business_banking/features/todo/api/todo_response_model.dart';
import 'package:business_banking/features/todo/api/todo_service.dart';
import 'package:business_banking/features/todo/model/todo_entity_model_list.dart';
import 'package:clean_framework/clean_framework.dart';

class TodoServiceAdapter extends ServiceAdapter<TodoEntityModelList,
    TodoRequestModel, TodoResponseModel, TodoService> {
  TodoServiceAdapter() : super(TodoService());

  @override
  TodoEntityModelList createEntity(
    TodoEntityModelList initialEntity,
    TodoResponseModel responseModel,
  ) {
    return TodoEntityModelList(responseModel.todos);
  }
}
