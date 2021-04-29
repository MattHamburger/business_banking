import 'dart:async';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../routes.dart';
import '../../bloc/todo_list_bloc.dart';
import '../../model/todo_list_view_model.dart';
import 'todo_hub_screen.dart';

class TodoHubPresenter extends Presenter<TodoListBloc, TodoListViewModel, TodoHubScreen> {
  @override
  Stream<TodoListViewModel> getViewModelStream(TodoListBloc bloc) {
    return bloc.todoListViewModelPipe.receive;
  }

  @override TodoHubScreen buildScreen(BuildContext context, TodoListBloc bloc,
      TodoListViewModel viewModel) {
    return TodoHubScreen(
      viewModel: viewModel,
      navigateToTodoList: () {


        _navigateToTodoList(context);
      },

    );
  }
  void _navigateToTodoList(BuildContext context) {

    context.router.push(BusinessBankingRouter.todoListRoute);
  }
}