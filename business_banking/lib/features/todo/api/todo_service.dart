import 'package:business_banking/features/todo/api/todo_request_model.dart';
import 'package:business_banking/features/todo/api/todo_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoService extends EitherService<TodoRequestModel, TodoResponseModel> {
  TodoService()
      : super(
          method: RestMethod.get,
          path: 'todos',
          restApi: ExampleLocator().api,
        );

  @override
  TodoResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return TodoResponseModel.fromJson(jsonResponse);
  }
}
