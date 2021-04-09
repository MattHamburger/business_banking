import 'package:business_banking/features/todo/model/item/todo_item_entity.dart';
import 'package:test/test.dart';

void main() {
  test('TodoItemEntity properties', () {
    final entity = TodoItemEntity(
      userId: 1,
      id: 1,
      title: "delectus aut autem",
      completed: false
    );

    expect(entity.userId, 1);
    expect(entity.id, 1);
    expect(entity.title, "delectus aut autem");
    expect(entity.completed, false);
    expect(
      entity.toString(),
      'TodoItemEntity([], 1, 1, delectus aut autem, false)',
    );
  });

  test('TodoItemEntity merge with null errors', () {
    final entity = TodoItemEntity(
      errors: [],
      userId: 1,
      id: 1,
      title: "delectus aut autem",
      completed: false
    );
    final merged = entity.merge(errors: null);
    expect(merged.errors, []);
    expect(merged.userId, 1);
    expect(merged.id, 1);
    expect(merged.title, "delectus aut autem");
    expect(merged.completed, false);
    expect(
      merged.toString(),
      'TodoItemEntity([], 1, 1, delectus aut autem, false)',
    );
  });
}
