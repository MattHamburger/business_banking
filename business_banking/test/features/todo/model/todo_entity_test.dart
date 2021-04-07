import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:test/test.dart';

void main() {
  test("TodoEntity should initialize with the values given", () {
    final entity = TodoEntity(
      id: 0,
      title: "title",
      userId: 0,
      completed: false,
    );
    expect(entity.id, 0);
    expect(entity.title, "title");
    expect(entity.userId, 0);
    expect(entity.completed, false);
  });
}
