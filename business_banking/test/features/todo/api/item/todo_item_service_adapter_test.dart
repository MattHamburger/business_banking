import 'package:business_banking/features/todo/api/item/todo_item_service_response_model.dart';
import 'package:business_banking/features/todo/bloc/item/todo_item_service_adapter.dart';
import 'package:business_banking/features/todo/model/item/todo_item_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = TodoItemServiceAdapter(0).createEntity(
        TodoItemEntity(),
        TodoItemServiceResponseModel.fromJson({
            "userId": 1,
            "id": 1,
            "title": "delectus aut autem",
            "completed": false
        }));

    expect(
        entity,
        TodoItemEntity(
          userId: 1,
          id: 1,
          title: "delectus aut autem",
          completed: false
        )
    );
  });
}
