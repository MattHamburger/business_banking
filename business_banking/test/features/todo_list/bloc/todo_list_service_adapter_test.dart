import 'package:business_banking/features/todo_list/api/todo_list_service_response_model.dart';
import 'package:business_banking/features/todo_list/bloc/todo_list_service_adapter.dart';
import 'package:business_banking/features/todo_list/model/todo_list_entity.dart';
import 'package:business_banking/features/todo_list/model/todo_task_entity.dart';
import 'package:test/test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = TodoListServiceAdapter().createEntity(
      TodoListEntity(),
      TodoListServiceResponseModel.fromJson({
        "todoTasks":
        [
          {
            "id": "123456",
            "task": "Hello Task",
            "description": "Hello task description",
            "completed": false
          },
        ]
      }
      ),
    );

    expect(
        entity,
        TodoListEntity(
            allTodoTasks: [TodoTaskEntity(id: '123456',
                task: 'Hello Task',
                description: 'Hello task description',
                completed: false)
            ],
        ));
  });
  test('init entity created is null then fails', () {
    try {
      TodoListServiceAdapter().createEntity(
        null,
        TodoListServiceResponseModel.fromJson({
          "todoTasks":
          [
            {
              "id": "123456",
              "task": "Hello Task",
              "description": "Hello task description",
              "completed": false
            },
          ]
        }),
      );
    } catch (e) {
      expect(e != null, true);
    }
  });
}
