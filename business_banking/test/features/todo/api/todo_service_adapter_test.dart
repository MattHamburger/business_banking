import 'package:business_banking/features/todo/api/todo_service_response_model.dart';
import 'package:business_banking/features/todo/bloc/todo_service_adapter.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Entity is created by service adapter', () {
    final entity = TodoServiceAdapter().createEntity(
        TodoEntity(),
        TodoServiceResponseModel.fromJson({
          "todos": [
            {
              "userId": 1,
              "id": 1,
              "title": "delectus aut autem",
              "completed": false
            },
            {
              "userId": 1,
              "id": 2,
              "title": "quis ut nam facilis et officia qui",
              "completed": false
            },
            {
              "userId": 1,
              "id": 3,
              "title": "fugiat veniam minus",
              "completed": false
            },
            {
              "userId": 1,
              "id": 4,
              "title": "et porro tempora",
              "completed": true
            },
            {
              "userId": 1,
              "id": 5,
              "title": "laboriosam mollitia et enim quasi adipisci quia provident illum",
              "completed": false
            },
            {
              "userId": 1,
              "id": 6,
              "title": "qui ullam ratione quibusdam voluptatem quia omnis",
              "completed": false
            },
            {
              "userId": 1,
              "id": 7,
              "title": "illo expedita consequatur quia in",
              "completed": false
            },
            {
              "userId": 1,
              "id": 8,
              "title": "quo adipisci enim quam ut ab",
              "completed": true
            },
            {
              "userId": 1,
              "id": 9,
              "title": "molestiae perspiciatis ipsa",
              "completed": false
            },
            {
              "userId": 1,
              "id": 10,
              "title": "illo est ratione doloremque quia maiores aut",
              "completed": true
            }
          ]
        }));

    expect(
        entity,
        TodoEntity(
            count: 10
        )
    );
  });
}
