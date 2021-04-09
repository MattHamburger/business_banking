import 'dart:async';
import 'package:business_banking/features/todo/bloc/item/todo_item_bloc.dart';
import 'package:business_banking/features/todo/model/item/todo_item_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'todo_item_screen.dart';

class TodoItemPresenter extends Presenter<TodoItemBloc, TodoItemViewModel, TodoItemScreen> {
  @override
  Stream<TodoItemViewModel> getViewModelStream(TodoItemBloc bloc) {
    return bloc.todoItemViewModelPipe.receive;
  }

  @override TodoItemScreen buildScreen(BuildContext context, TodoItemBloc bloc,
      TodoItemViewModel viewModel) {
    return TodoItemScreen(
      viewModel: viewModel,
    );
  }
}