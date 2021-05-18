import 'package:business_banking/features/statement/model/statement.dart';
import 'package:equatable/equatable.dart';

abstract class StatementEvent extends Equatable {}

class SendStatementToEmail implements StatementEvent {
  final Statement statement;
  final String recipient;

  SendStatementToEmail(this.statement, this.recipient);

  @override
  List<Object> get props => [statement, recipient];

  @override
  bool get stringify => true;
}
