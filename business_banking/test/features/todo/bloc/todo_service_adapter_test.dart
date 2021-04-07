import 'package:business_banking/features/todo/api/todo_details/todo_details_response_model.dart';
import 'package:business_banking/features/todo/api/todo_response_model.dart';
import 'package:business_banking/features/todo/bloc/todo_details/todo_details_service_adapter.dart';
import 'package:business_banking/features/todo/bloc/todo_service_adapter.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:business_banking/features/todo/model/todo_entity_model_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Todo Service Adapter tests', () {
    test('should create TodoEntity', () {
      final entity = TodoServiceAdapter().createEntity(
          TodoEntityModelList(),
          TodoResponseModel.fromJson({
            "todos": List.generate(
                2,
                (i) => {
                      "id": i,
                      "name": "todo$i",
                      "completed": false,
                      "userId": 0,
                    })
          }));
      expect(
        entity,
        TodoEntityModelList(List.generate(
            2,
            (i) => TodoEntity(
                  id: i,
                  title: "todo$i",
                  completed: false,
                  userId: 0,
                ))),
      );
    });
  });

  group('Todo Service Adapter tests', () {
    test('should create TodoEntity', () {
      final entity = TodoDetailsServiceAdapter().createEntity(
          TodoEntity(),
          TodoDetailsResponseModel.fromJson({
            "id": 1,
            "name": "todo1",
            "completed": false,
            "userId": 0,
          }));
      expect(
        entity,
        TodoEntity(id: 1, title: "todo1", completed: false, userId: 0),
      );
    });
  });
}
