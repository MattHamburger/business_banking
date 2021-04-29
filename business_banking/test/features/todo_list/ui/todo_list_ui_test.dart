import 'package:business_banking/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:business_banking/features/todo_list/ui/todo_list_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../lib/features/todo_list/ui/todo_list_presenter.dart';

void main() {
  testWidgets('Todo List, with true bloc', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<TodoListBloc>(
        create: (_) => TodoListBloc(),
        child: TodoListWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TodoListPresenter), findsOneWidget);
  });
}
