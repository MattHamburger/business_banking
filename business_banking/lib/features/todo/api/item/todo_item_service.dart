import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

import 'todo_item_service_response_model.dart';

class TodoItemService
    extends EitherService<JsonRequestModel, TodoItemServiceResponseModel> {
  final bool debugEnabled = false;
  final int _index;

  TodoItemService({int index})
    : _index = index,
        super(
        method: RestMethod.get,
        restApi: ExampleLocator().api,
        path: 'todos'
      );

  @override
  TodoItemServiceResponseModel parseResponse(Map<String, dynamic> jsonResponse) {
    if (debugEnabled) {
      logger().debug('TodoItemService JSON: ' + jsonResponse.toString());
    }
    jsonResponse = jsonResponse["todos"][_index]; // pass on only the item for this widget
    return TodoItemServiceResponseModel.fromJson(jsonResponse);
  }
}