import 'package:business_banking/features/todo/api/todo_service.dart';
import 'package:business_banking/features/todo/bloc/todo_bloc.dart';
import 'package:business_banking/features/todo/ui/todo_presenter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/widgets.dart';

class TodoFeatureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (_) => TodoBloc(TodoService()),
      child: TodoPresenter(),
    );
  }
}
