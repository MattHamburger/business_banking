import 'package:business_banking/features/todo/api/item/todo_item_service_response_model.dart';
import 'package:business_banking/features/todo/model/item/todo_item_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/todo/api/item/todo_item_service.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import '../../../../locator.dart';

class TodoItemServiceAdapter extends ServiceAdapter<TodoItemEntity,
    JsonRequestModel, TodoItemServiceResponseModel, TodoItemService> {
  final int _index;
  TodoItemServiceAdapter(this._index) : super(TodoItemService(index: _index));
  final bool debugEnabled = false;

  @override
  TodoItemEntity createEntity(
      TodoItemEntity todoItemEntityModelList,
      TodoItemServiceResponseModel responseModel) {
    if (debugEnabled) {
      logger().debug('TodoItemEntityModelList CreateEntity: ' +
          responseModel.toString());
    }

    return todoItemEntityModelList.merge(
      userId: responseModel.userId,
      id: responseModel.id,
      title: responseModel.title,
      completed: responseModel.completed,
    );
  }
}