import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'features/todo/model/item/todo_item_entity.dart';

class DuplicationRepository extends Repository {

  //the default Repository in the clean framework creates a state for each type of widget, however,
  //if there is a widget which makes copies of itself and each needs its own state, the Repository
  //cannot support it. I made this special Repository to allow the TodoItem widget to have a scope
  //based on its index

  @override
  RepositoryScope create<E extends Entity>(
      E entity, Function(dynamic) subscription,
      {bool deleteIfExists = false, int index}) {
    var existingScope;
    if (E == TodoItemEntity) {
      existingScope = scopes.keys.firstWhere(
              (element) {
            TodoItemEntity entity;
            try {
              entity = scopes[element];
              if (entity.id - 1 == index) {
                return true;
              }
            } catch (e) {
              return false;
            }
            return false;
          },
          orElse: () => null
      );
    } else {
      existingScope = scopes.keys.firstWhere(
              (element) => scopes[element].runtimeType == entity.runtimeType,
          orElse: () => null);
    }
    if (existingScope != null && !deleteIfExists) {
      existingScope.subscription = subscription;
      return existingScope;
    } else if (existingScope != null && deleteIfExists) {
      scopes.remove(existingScope);
    }

    RepositoryScope scope = RepositoryScope(subscription);
    scopes[scope] = entity;
    return scope;

  }

  RepositoryScope containsScope<E extends Entity>([int index]) {
    if (E == TodoItemEntity) {
      final existingScope = scopes.keys.firstWhere(
              (element) {
            TodoItemEntity entity;
            try {
              entity = scopes[element];
            } catch (e) {
              return false;
            }
            return entity.id - 1 == index;
          },
          orElse: () => null);
      return (existingScope);
    }
    final existingScope = scopes.keys.firstWhere(
            (element) => scopes[element].runtimeType == E,
        orElse: () => null);
    return (existingScope);
  }

}
