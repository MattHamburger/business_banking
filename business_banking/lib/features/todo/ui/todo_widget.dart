import 'package:business_banking/features/todo/bloc/todo_bloc.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'todo_presenter.dart';

class TodoWidget extends StatelessWidget {
  final bool debugEnabled = false;

  @override
  Widget build(BuildContext context) {
    if (debugEnabled) {
      logger().debug("Widget Built");
    }

    return BlocProvider<TodoBloc>(
      create: (_) => TodoBloc(),
      child: TodoPresenter(),
    );
  }
}