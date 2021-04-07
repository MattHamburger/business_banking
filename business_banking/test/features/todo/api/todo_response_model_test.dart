import 'package:business_banking/features/todo/api/todo_details/todo_details_response_model.dart';
import 'package:business_banking/features/todo/api/todo_details/todo_details_service.dart';
import 'package:business_banking/features/todo/api/todo_response_model.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:test/test.dart';

void main() {
  group("TodoResponseModel", () {
    test("two empty models should be equal", () {
      expect(TodoResponseModel(), TodoResponseModel());
    });
    test("response model should read in the JSON", () {
      final model = TodoResponseModel.fromJson({
        "todos": List.generate(
            2,
            (i) => {
                  "id": i,
                  "title": "todo$i",
                  "userId": 0,
                  "completed": false,
                })
      });
      expect(
        model,
        TodoResponseModel(
          todos: List.generate(
              2,
              (i) => TodoEntity(
                    id: i,
                    title: "todo$i",
                    userId: 0,
                    completed: false,
                  )),
        ),
      );
    });
  });
  group('TodoDetailsResponseModel', () {
    test('should be equal if using the same parameters', () {
      final model = TodoDetailsResponseModel();
      final other = TodoDetailsResponseModel();
      expect(model, other);
    });
    test('should be created from json', () {
      final model = TodoDetailsService().parseResponse({
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
