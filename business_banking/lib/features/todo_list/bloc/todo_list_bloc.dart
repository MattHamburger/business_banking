import 'package:business_banking/features/todo_list/model/todo_list_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'todo_list_usecase.dart';

class TodoListBloc extends Bloc {
  late TodoListUseCase _useCase;

  final todoListViewModelPipe = Pipe<TodoListViewModel>();

  @override
  void dispose() {
    todoListViewModelPipe.dispose();
  }

  TodoListBloc({todoListService}) {
    _useCase = TodoListUseCase(
        (viewModel) => todoListViewModelPipe.send(viewModel as TodoListViewModel));
    todoListViewModelPipe.whenListenedDo(_useCase.create);
  }
}
