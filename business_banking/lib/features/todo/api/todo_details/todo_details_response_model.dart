import 'package:clean_framework/clean_framework_defaults.dart';

class TodoDetailsResponseModel extends JsonResponseModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoDetailsResponseModel({this.userId, this.completed, this.title, this.id});

  factory TodoDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      TodoDetailsResponseModel(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );

  @override
  List<Object> get props => [userId, id, title, completed];
}
