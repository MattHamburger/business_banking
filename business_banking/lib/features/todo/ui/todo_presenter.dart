import 'dart:async';
import 'package:business_banking/features/todo/bloc/todo_bloc.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'todo_screen.dart';

class TodoPresenter extends Presenter<TodoBloc, TodoViewModel, TodoScreen> {
  @override
  Stream<TodoViewModel> getViewModelStream(TodoBloc bloc) {
    return bloc.todoViewModelPipe.receive;
  }

  @override TodoScreen buildScreen(BuildContext context, TodoBloc bloc,
      TodoViewModel viewModel) {
    return TodoScreen(
      viewModel: viewModel,
    );
  }
}