import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/todo/api/todo_service.dart';
import 'todo_usecase.dart';

class TodoBloc extends Bloc {
  TodoUseCase _useCase;

  final todoViewModelPipe = Pipe<TodoViewModel>();

  @override
  void dispose() {
    //why don't we call super.dispose?
    todoViewModelPipe.dispose();
  }

  TodoBloc({TodoService todoService}) { //why do we allow an optional named parameter that isn't even used?
    _useCase = TodoUseCase(
        (viewModel) => todoViewModelPipe.send(viewModel));
    todoViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
