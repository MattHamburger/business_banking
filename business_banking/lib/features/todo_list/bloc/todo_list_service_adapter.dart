import 'package:business_banking/features/todo_list/api/todo_list_service.dart';
import 'package:business_banking/features/todo_list/api/todo_list_service_response_model.dart';
import 'package:business_banking/features/todo_list/model/todo_list_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoListServiceAdapter extends ServiceAdapter<TodoListEntity,
    JsonRequestModel, TodoListServiceResponseModel, TodoListService> {
  TodoListServiceAdapter() : super(TodoListService());

  @override
  TodoListEntity createEntity(
      TodoListEntity? todoListEntityModelList,
      TodoListServiceResponseModel responseModel) {


    return TodoListEntity(
      allTodoTasks :responseModel.allTodoTasks
    );
  }
}