import 'package:clean_framework/clean_framework.dart';

import '../statement.dart';

class StatementEntity extends Entity {
  final List<Statement> statements;

  StatementEntity({
    List<EntityFailure> errors = const [],
    List<Statement>? statements,
  })  : statements = statements ?? List<Statement>.empty(growable: false),
        super(errors: errors);

  @override
  List<Object> get props => [errors, statements];

  @override
  merge({
    errors,
    List<Statement>? statements,
  }) {
    return StatementEntity(
        statements: statements ?? this.statements, errors: errors ?? []);
  }
}
