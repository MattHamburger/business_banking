import 'package:business_banking/features/todo/bloc/todo_bloc.dart';
import 'package:business_banking/features/todo/ui/todo_presenter.dart';
import 'package:business_banking/features/todo/ui/todo_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Todo, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<TodoBloc>(
            create: (_) => TodoBloc(), child: TodoWidget()));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TodoPresenter), findsOneWidget);
  });
}
