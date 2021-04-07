import 'package:business_banking/features/todo/api/todo_response_model.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:business_banking/features/todo/model/todo_entity_model_list.dart';
import 'package:test/test.dart';

void main() {
  group("TodoEntityModelList", () {
    test("should create with empty list, if given no parametesr", () {
      final entity = TodoEntityModelList();
      expect(entity.entities.length, 0);
    });

    test("should return self, if given no model", () {
      final entity = TodoEntityModelList();
      expect(entity.merge(), entity);
    });

    test("should return self, if given blank model list", () {
      final entity = TodoEntityModelList();
      final TodoEntityModelList other =
          entity.merge(response: TodoResponseModel(todos: []));
      expect(other, entity);
    });

    test("should combine self with ResponseModel", () {
      final entity = TodoEntityModelList();
      expect(
        entity.merge(
          response: TodoResponseModel(todos: [TodoEntity()]),
        ),
        TodoEntityModelList([
          TodoEntity(
            id: 0,
            title: "todo0",
            completed: false,
            userId: 0,
          )
        ]),
      );
    });
  });
}
