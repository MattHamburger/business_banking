import 'package:business_banking/features/todo/api/todo_details/todo_details_response_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TodoEntity extends Entity {
  final int id;
  final String title;
  final int userId;
  final bool completed;

  TodoEntity({this.id, this.title, this.userId, this.completed});
  factory TodoEntity.fromResponseModel(TodoDetailsResponseModel response) {
    return TodoEntity(
      id: response.id,
      title: response.title,
      userId: response.userId,
      completed: response.completed,
    );
  }
}
