import 'package:business_banking/features/todo/bloc/todo_usecase.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:test/test.dart';

void main() {
  test('TodoUseCase init and created', () {
    final useCase = TodoUseCase((viewModel) {
      expect(viewModel, isA<TodoViewModel>());
    });
    useCase.create();
  });
  test('TodoUseCase init and re-created', () {
    final useCase = TodoUseCase((viewModel) {
      expect(viewModel, isA<TodoViewModel>());
    });
    useCase.create();
    useCase.create();
  });
}
