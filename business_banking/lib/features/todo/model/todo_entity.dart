import 'package:clean_framework/clean_framework.dart';

class TodoEntity extends Entity {
  final int count;

  TodoEntity({
    List<EntityFailure> errors = const [],
    int count,
  })  : count = count ?? 0,
        super(errors: errors);

  @override
  List<Object> get props => [errors, count];

  @override
  merge({errors, int count}) {
    return TodoEntity(
      errors: errors ?? this.errors,
      count: count ?? this.count,
    );
  }
}