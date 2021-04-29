import 'package:business_banking/features/todo_list/api/todo_list_service.dart';
import 'package:business_banking/features/todo_list/api/todo_list_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

void main() {
  test(
    'Todo List Service success',
    () async {
      final service = TodoListService();
      final Either<ServiceFailure, TodoListServiceResponseModel>
          eitherResponse = await service.request();

      expect(eitherResponse.isRight, isTrue);
      expect(
        eitherResponse.fold((_) {}, (m) => m),
        TodoListServiceResponseModel.fromJson(
            {
              "todoTasks":
              [
                {
                  "id":"123456",
                  "task": "Hello Task",
                  "description": "Hello task description",
                  "completed": false
                },
                {
                  "id":"654321",
                  "task": "Hello Task",
                  "description": "Hello task description",
                  "completed": false
                },
              ]
            }
        ),
      );
    },
  );
}
