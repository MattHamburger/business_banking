import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:clean_framework/clean_framework.dart';

enum EmailServiceStatus { initial, success, error }

class StatementViewModel extends ViewModel {
  final List<Statement> statements;
  final ServiceResponseStatus serviceResponseStatus;
  final EmailServiceStatus emailServiceStatus;

  StatementViewModel(
      {required this.statements,
      this.serviceResponseStatus = ServiceResponseStatus.unknown,
      this.emailServiceStatus = EmailServiceStatus.initial});

  @override
  List<Object?> get props =>
      [statements, serviceResponseStatus, emailServiceStatus];
}
