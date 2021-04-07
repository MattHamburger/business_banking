import 'package:business_banking/features/todo/bloc/todo_bloc.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:business_banking/features/todo/model/todo_view_model_list.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class TodoBlocMock extends Fake implements TodoBloc {
  final Pipe<TodoViewModelList> todoViewModelListPipe =
      Pipe<TodoViewModelList>();

  TodoBlocMock() {
    todoViewModelListPipe.whenListenedDo(() {
      todoViewModelListPipe.send(
        TodoViewModelList(List.generate(
            5,
            (i) => TodoViewModel(
                  id: i,
                  name: "title$i",
                ))),
      );
    });
  }

  @override
  void dispose() {
    todoViewModelListPipe.dispose();
  }
}
