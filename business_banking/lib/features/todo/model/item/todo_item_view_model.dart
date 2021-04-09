import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TodoItemViewModel extends ViewModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  TodoItemViewModel({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.completed,
  });

  @override
  List<Object> get props => [userId, id, title, completed];
}