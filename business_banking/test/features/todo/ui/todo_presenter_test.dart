import 'package:business_banking/features/todo/bloc/todo_bloc.dart';
import 'package:business_banking/features/todo/ui/todo_presenter.dart';
import 'package:business_banking/features/todo/ui/todo_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../bloc/todo_bloc_mock.dart';

void main() {
  testWidgets("UI should appear", (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<TodoBloc>(
        create: (_) => TodoBlocMock(),
        child: TodoPresenter(),
      ),
    ));
    expect(find.text("Loading"), findsOneWidget);
    await tester.pump();
    expect(find.byType(TodoScreen), findsOneWidget);
    expect(find.byType(ListTile), findsNWidgets(5));
  });
}
