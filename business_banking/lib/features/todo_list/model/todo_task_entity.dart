import 'package:clean_framework/clean_framework.dart';

class TodoTaskEntity extends Entity {
  final String id;
  final String task;
  final String description;
  final bool completed;

  TodoTaskEntity({
    required this.id,
    required this.task,
    required this.description,
    required this.completed,
  });
  TodoTaskEntity.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        task = json['task'] ?? '',
        description = json['description'] ?? '',
        completed = json['completed'] ?? '';
  @override
  List<Object> get props => [id,task, description, completed];
}
