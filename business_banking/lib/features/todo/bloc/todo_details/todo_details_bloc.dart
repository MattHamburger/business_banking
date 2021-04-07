import 'package:business_banking/features/todo/api/todo_details/todo_details_service.dart';
import 'package:business_banking/features/todo/bloc/todo_details/todo_details_usecase.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class TodoDetailsBloc extends Bloc {
  TodoDetailsUsecase _usecase;
  final Pipe<TodoViewModel> todoViewModelPipe = Pipe<TodoViewModel>();

  TodoDetailsBloc(TodoEntity entity, [TodoDetailsService service]) {
    _usecase = TodoDetailsUsecase(
      (viewModel) {
        return todoViewModelPipe.send(viewModel);
      },
    );
    todoViewModelPipe.whenListenedDo(() => _usecase.create(entity));
  }

  @override
  void dispose() {
    todoViewModelPipe.dispose();
  }
}
