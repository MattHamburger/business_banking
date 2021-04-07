import 'package:business_banking/features/todo/api/todo_details/todo_details_service.dart';
import 'package:business_banking/features/todo/bloc/todo_bloc.dart';
import 'package:business_banking/features/todo/bloc/todo_details/todo_details_bloc.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:business_banking/features/todo/model/todo_view_model.dart';
import 'package:business_banking/features/todo/model/todo_view_model_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Todo Bloc', () {
    test('should do something with the pipe', () {
      final bloc = TodoBloc();
      bloc.todoViewModelListPipe.receive.listen(expectAsync1((event) {
        expect(event, isA<TodoViewModelList>());
        expect(event.viewModels.length, 200);
        expect(event.viewModels[0].name, "delectus aut autem");
      }));
    });
  });

  group('Todo Details Bloc', () {
    test('should emit something in the pipe', () {
      final bloc = TodoDetailsBloc(TodoEntity(id: 10));
      bloc.todoViewModelPipe.receive.listen(expectAsync1((event) {
        expect(event, isA<TodoViewModel>());
        expect(event.id, 10);
        expect(event.name, "illo est ratione doloremque quia maiores aut");
      }));
    });
  });
}
