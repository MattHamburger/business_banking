import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:business_banking/features/todo/model/todo_view_model_list.dart';
import 'package:business_banking/features/todo/ui/todo_widget.dart';
import 'package:business_banking/features/todo/ui/todo_presenter.dart';
import 'package:business_banking/features/todo/ui/todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _buildApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

void main() {
  group("TodoScreen tests", () {
    testWidgets("should display", (tester) async {
      await tester.pumpWidget(TodoScreen(TodoViewModelList([]), (_) {}));
      expect(find.byType(Card), findsOneWidget);
    });

    testWidgets("should activate the onPressed", (tester) async {
      final hasBeenPressed = List.generate(5, (i) => false);
      await tester.pumpWidget(
        _buildApp(
          TodoScreen(
            TodoViewModelList(
              List.generate(5, (i) => TodoViewModel(id: i, name: "todo$i")),
            ),
            (i) {
              hasBeenPressed[i] = true;
            },
          ),
        ),
      );

      for (var i in Iterable.generate(5).toList()) {
        expect(hasBeenPressed[i], false);
        await tester.tap(find.text("todo$i"));
        expect(hasBeenPressed[i], true);
      }
    });

    testWidgets("TodoWidget should build its presenter", (tester) async {
      await tester.pumpWidget(TodoFeatureWidget());
      expect(find.byType(TodoPresenter), findsOneWidget);
    });
  });
}
