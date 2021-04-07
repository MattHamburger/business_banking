import 'package:business_banking/features/todo/api/todo_details/todo_details_request_model.dart';
import 'package:business_banking/features/todo/api/todo_details/todo_details_response_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class TodoDetailsService
    extends EitherService<TodoDetailsRequestModel, TodoDetailsResponseModel> {
  TodoDetailsService()
      : super(
          method: RestMethod.get,
          path: 'todos',
          restApi: ExampleLocator().api,
        );

  @override
  TodoDetailsResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    return TodoDetailsResponseModel.fromJson(jsonResponse);
  }
}
