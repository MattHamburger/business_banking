import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:test/test.dart';

void main() {
  test('TodoEntity properties', () {
    final entity = TodoEntity(
      count: 10,
    );

    expect(entity.count, 10);
    expect(
      entity.toString(),
      'TodoEntity([], 10)',
    );
  });

  test('TodoEntity merge with null errors', () {
    final entity = TodoEntity(
      errors: [],
      count: 10,
    );
    final merged = entity.merge(errors: null);
    expect(merged.errors, []);
    expect(merged.count, 10);
    expect(
      merged.toString(),
      'TodoEntity([], 10)',
    );
  });
}
