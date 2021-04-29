import 'dart:async';
import 'package:business_banking/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:business_banking/features/todo_list/model/todo_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'todo_list_screen.dart';

class TodoListPresenter extends Presenter<TodoListBloc, TodoListViewModel, TodoListScreen> {
  @override
  Stream<TodoListViewModel> getViewModelStream(TodoListBloc bloc) {
    return bloc.todoListViewModelPipe.receive;
  }

  @override
  TodoListScreen buildScreen(
      BuildContext context, TodoListBloc bloc, TodoListViewModel viewModel) {
    return TodoListScreen(
      viewModel: viewModel,
    );
  }
}
