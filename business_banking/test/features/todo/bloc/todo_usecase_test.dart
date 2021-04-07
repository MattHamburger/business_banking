import 'package:business_banking/features/todo/bloc/todo_details/todo_details_usecase.dart';
import 'package:business_banking/features/todo/bloc/todo_usecase.dart';
import 'package:business_banking/features/todo/model/todo_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Todo Usecase", () {
    test('should be a UseCase', () {
      expect(TodoUsecase((_) {}), isA<UseCase>());
    });

    test('should fail to create with null viewmodel callback', () {
      var usecase;
      try {
        usecase = TodoUsecase(null);
        // this line shouldn't run
        expect(usecase, null);
      } catch (e) {
        expect(e, isA<AssertionError>());
      }
    });

    test('should call viewmodel callback in create()', () async {
      var hasRun = false;
      final usecase = TodoUsecase((viewModel) {
        hasRun = true;
        expect(viewModel, isA<ViewModel>());
      });
      expect(usecase, isNotNull);
      await usecase.create();
      await usecase.create();
      expect(hasRun, true);
    });
  });

  group("Todo Details Usecase", () {
    test('should be a UseCase', () {
      expect(TodoDetailsUsecase((_) {}), isA<UseCase>());
    });

    test('should fail to create with null viewmodel callback', () {
      var usecase;
      try {
        usecase = TodoDetailsUsecase(null);
        // this line shouldn't run
        expect(usecase, null);
      } catch (e) {
        expect(e, isA<AssertionError>());
      }
    });

    test('should call viewmodel callback in create()', () async {
      var hasRun = false;
      final entity =
          TodoEntity(id: 1, title: 'todo1', completed: false, userId: 42);
      final usecase = TodoDetailsUsecase((viewModel) {
        hasRun = true;
        expect(viewModel, isA<ViewModel>());
      });

      expect(usecase, isNotNull);
      await usecase.create(entity);
      await usecase.create(entity);
      expect(hasRun, true);
    });
  });
}
