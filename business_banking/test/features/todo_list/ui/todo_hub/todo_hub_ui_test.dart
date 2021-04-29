import 'package:business_banking/features/todo_list/ui/todo_hub/todo_hub_presenter.dart';
import 'package:business_banking/features/todo_list/ui/todo_hub/todo_hub_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../../lib/features/todo_list/bloc/todo_list_bloc.dart';

void main() {
  testWidgets('TodoUI', (tester) async {
    final testWidget = MaterialApp(
      home: BlocProvider<TodoListBloc>(
        create: (_) => TodoListBloc(),
        child: TodoHubWidget(),
      ),
    );

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TodoHubPresenter), findsOneWidget);
  });
}
