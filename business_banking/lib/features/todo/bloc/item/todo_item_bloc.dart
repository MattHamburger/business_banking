import 'package:business_banking/features/todo/bloc/item/todo_item_service_adapter.dart';
import 'package:business_banking/features/todo/model/item/todo_item_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/todo/api/item/todo_item_service.dart';
import 'todo_item_usecase.dart';

class TodoItemBloc extends Bloc {
  TodoItemUseCase _useCase;

  final todoItemViewModelPipe = Pipe<TodoItemViewModel>();

  @override
  void dispose() {
    todoItemViewModelPipe.dispose();
  }

  TodoItemBloc({int index, TodoItemService todoService}) {
    // EitherService.request(requestModel: createRequest(initialEntity)).then((data) {

    // });
    _useCase = TodoItemUseCase(
      index,
      (viewModel) => todoItemViewModelPipe.send(viewModel));
    todoItemViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
