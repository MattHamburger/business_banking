import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'todo_service_response_model.dart';

class TodoService
    extends EitherService<JsonRequestModel, TodoServiceResponseModel> {
  final bool debugEnabled = false;

  TodoService()
    : super(
        method: RestMethod.get,
        restApi: ExampleLocator().api,
        path: 'todos'
      );

  @override
  TodoServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    if (debugEnabled) {
      logger().debug('TodoService JSON: ' + jsonResponse.toString());
    }

    return TodoServiceResponseModel.fromJson(jsonResponse);
  }
}