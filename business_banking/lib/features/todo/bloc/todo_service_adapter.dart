import 'package:business_banking/features/todo/api/todo_service_response_model.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/todo/api/todo_service.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../locator.dart';

class TodoServiceAdapter extends ServiceAdapter<TodoEntity,
    JsonRequestModel, TodoServiceResponseModel, TodoService> {
  TodoServiceAdapter() : super(TodoService());
  final bool debugEnabled = false;

  @override
  TodoEntity createEntity(
      TodoEntity todoEntityModelList,
      TodoServiceResponseModel responseModel) {
    if (debugEnabled) {
      logger().debug('TodoEntityModelList CreateEntity: ' +
          responseModel.toString());
    }

    return todoEntityModelList.merge(
      count: responseModel.count,
    );
  }
}