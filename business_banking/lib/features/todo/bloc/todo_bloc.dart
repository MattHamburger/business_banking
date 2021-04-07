import 'package:business_banking/features/todo/api/todo_service.dart';
import 'package:business_banking/features/todo/bloc/todo_usecase.dart';
import 'package:business_banking/features/todo/model/todo_view_model_list.dart';
import 'package:clean_framework/clean_framework.dart';

class TodoBloc extends Bloc {
  TodoUsecase _usecase;
  final Pipe<TodoViewModelList> todoViewModelListPipe =
      Pipe<TodoViewModelList>();

  TodoBloc([TodoService service]) {
    _usecase = TodoUsecase(
      (viewModel) {
        return todoViewModelListPipe.send(viewModel);
      },
    );
    todoViewModelListPipe.whenListenedDo(() => _usecase.create());
  }

  @override
  void dispose() {
    todoViewModelListPipe.dispose();
  }
}
