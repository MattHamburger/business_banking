import 'package:business_banking/features/todo/api/todo_details/todo_details_request_model.dart';
import 'package:business_banking/features/todo/api/todo_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TodoRequestModel should be converted to JSON', () {
    expect(TodoRequestModel().toJson(), {});
  });
  test('TodoDetailsRequestModel should be converted to JSON', () {
    final model = TodoDetailsRequestModel(42);
    expect(model.toJson(), {'id': 42});
  });
}
