import 'package:business_banking/features/todo/bloc/item/todo_item_bloc.dart';
import 'package:business_banking/features/todo/ui/item/todo_item_presenter.dart';
import 'package:business_banking/features/todo/ui/item/todo_item_widget.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TodoItem, with true bloc', (tester) async {
    final testWidget = MaterialApp(
        home: BlocProvider<TodoItemBloc>(
            create: (_) => TodoItemBloc(index: 0), child: Card(child: TodoItemWidget(index: 0,),)));

    await tester.pumpWidget(testWidget);
    await tester.pump(Duration(milliseconds: 500));

    expect(find.byType(TodoItemPresenter), findsOneWidget);
  });
}
