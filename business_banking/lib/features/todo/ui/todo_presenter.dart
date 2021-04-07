import 'package:business_banking/features/todo/bloc/todo_bloc.dart';
import 'package:business_banking/features/todo/model/todo_view_model_list.dart';
import 'package:business_banking/features/todo/ui/todo_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoPresenter extends Presenter<TodoBloc, TodoViewModelList, TodoScreen> {
  @override
  TodoScreen buildScreen(
    BuildContext context,
    TodoBloc bloc,
    TodoViewModelList viewModel,
  ) {
    return TodoScreen(viewModel, (i) => navigateToTodoDetails(context));
  }

  @override
  Stream<TodoViewModelList> getViewModelStream(TodoBloc bloc) {
    return bloc.todoViewModelListPipe.receive;
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Card(
      child: Text(
        'Loading',
        textDirection: TextDirection.ltr,
      ),
    );
  }

  void navigateToTodoDetails(BuildContext context) {
    print("$runtimeType navigation called");
  }
}
