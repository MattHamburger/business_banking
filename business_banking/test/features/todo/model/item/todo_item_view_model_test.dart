import 'package:business_banking/features/todo/model/item/todo_item_view_model.dart';
import 'package:test/test.dart';

void main() {
  test('TodoItemViewModel initialize', () async {
    final viewModel = TodoItemViewModel(
      userId: 1,
      id: 1,
      title: "delectus aut autem",
      completed: false
    );

    expect(viewModel.userId, 1);
    expect(viewModel.id, 1);
    expect(viewModel.title, "delectus aut autem");
    expect(viewModel.completed, false);
  });
}
