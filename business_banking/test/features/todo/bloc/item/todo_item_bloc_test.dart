import 'package:business_banking/features/todo/bloc/item/todo_item_bloc.dart';
import 'package:business_banking/features/todo/model/item/todo_item_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TodoItemBloc gets view model, real', () {
    final bloc = TodoItemBloc(index: 0);

    bloc.todoItemViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<TodoItemViewModel>());
      expect(model.userId, 1);
      expect(model.id, 1);
      expect(model.title, "delectus aut autem");
      expect(model.completed, false);
    }));
  });
}
