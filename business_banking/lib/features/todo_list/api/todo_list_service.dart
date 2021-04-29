import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';
import 'todo_list_service_response_model.dart';

class TodoListService
    extends EitherService<JsonRequestModel, TodoListServiceResponseModel> {
  TodoListService()
      : super(
            method: RestMethod.get,
            restApi: ExampleLocator().api,
            path: 'todos');

  @override
  TodoListServiceResponseModel parseResponse(
      Map<String, dynamic> jsonResponse) {
    return TodoListServiceResponseModel.fromJson(jsonResponse);
  }
}
