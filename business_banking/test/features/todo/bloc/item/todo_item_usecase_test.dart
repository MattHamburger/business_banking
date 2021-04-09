import 'package:business_banking/features/todo/bloc/item/todo_item_usecase.dart';
import 'package:business_banking/features/todo/model/item/todo_item_view_model.dart';
import 'package:test/test.dart';

void main() {
  test('TodoItemUseCase init and created', () {
    final useCase = TodoItemUseCase(0, (viewModel) {
      expect(viewModel, isA<TodoItemViewModel>());
    });
    useCase.create();
  });
  test('TodoItemUseCase init and re-created', () {
    final useCase = TodoItemUseCase(0, (viewModel) {
      expect(viewModel, isA<TodoItemViewModel>());
    });
    useCase.create();
    useCase.create();
  });
}
