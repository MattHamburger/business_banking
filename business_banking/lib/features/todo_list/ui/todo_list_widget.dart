import 'package:business_banking/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import 'todo_list_presenter.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return BlocProvider<TodoListBloc>(
      create: (_) => TodoListBloc(),
      child: TodoListPresenter(),
    );
  }
}