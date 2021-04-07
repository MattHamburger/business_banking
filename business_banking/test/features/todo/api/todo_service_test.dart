import 'package:business_banking/features/todo/api/todo_details/todo_details_response_model.dart';
import 'package:business_banking/features/todo/api/todo_details/todo_details_service.dart';
import 'package:business_banking/features/todo/api/todo_response_model.dart';
import 'package:business_banking/features/todo/api/todo_service.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:test/test.dart';

void main() {
  group("TodoServiceTest", () {
    test("should point to /todos", () {
      final service = TodoService();
      expect(service.path, "todos");
    });

    test("should correctly parse response", () {
      final service = TodoService();
      expect(
        service.parseResponse({
          "todos": List.generate(
              2,
              (i) => {
                    "id": i,
                    "name": "todo$i",
                    "completed": false,
                    "userId": 0,
                  })
        }),
        TodoResponseModel(
          todos: List.generate(
              2,
              (i) => TodoEntity(
                    id: i,
                    title: "todo$i",
                    completed: false,
                    userId: 0,
                  )),
        ),
      );
    });
  });
  group('TodoDetailsService tests', () {
    test('should point to /todos', () {
      final service = TodoDetailsService();
      expect(service.path, "todos");
    });
    test('should parse the response', () {
      final model = TodoDetailsResponseModel.fromJson({
        "userId": 10,
        "id": 199,
        "title": "numquam repellendus a magnam",
        "completed": true
      });
      expect(model.userId, 10);
      expect(model.id, 199);
      expect(model.title, "numquam repellendus a magnam");
      expect(model.completed, true);
    });
  });
}
