import 'package:business_banking/features/todo_list/bloc/todo_list_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Todo List Bloc gets view model, real',
    () {
      final bloc = TodoListBloc();

      bloc.todoListViewModelPipe.receive.listen(
        expectAsync1(
          (model) {
            expect(model.allTodoTasks.elementAt(0).id.toString(), '123456');
            expect(model.allTodoTasks.elementAt(0).task.toString(), 'Hello Task');
            expect(model.allTodoTasks.elementAt(0).description.toString(), 'Hello task description');
            expect(model.allTodoTasks.elementAt(0).completed, false);
          },
        ),
      );
    },
  );
}
