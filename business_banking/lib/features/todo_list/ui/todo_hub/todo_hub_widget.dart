import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import '../../bloc/todo_list_bloc.dart';
import 'todo_hub_presenter.dart';

class TodoHubWidget extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    if (debugEnabled) {
      logger().debug("Widget Built");
    }

    return BlocProvider<TodoListBloc>(
      create: (_) => TodoListBloc(),
      child: TodoHubPresenter(),
    );
  }
}