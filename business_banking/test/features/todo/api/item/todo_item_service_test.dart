import 'package:business_banking/features/todo/api/item/todo_item_service.dart';
import 'package:business_banking/features/todo/api/item/todo_item_service_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TodoItemService success', () async {
    final service = TodoItemService(index: 0);
    final eitherResponse = await service.request(requestModel: null);

    expect(eitherResponse.isRight, isTrue);
    expect(
      eitherResponse.fold((_) {}, (m) => m),
      TodoItemServiceResponseModel.fromJson({
          "userId": 1,
          "id": 1,
          "title": "delectus aut autem",
          "completed": false
      }),
    );

  });
}