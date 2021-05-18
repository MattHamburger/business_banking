import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:business_banking/features/statement/model/statement.dart';
import 'package:business_banking/features/statement/model/statement/statement_entity.dart';
import 'package:business_banking/features/statement/model/statement/statement_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:url_launcher/url_launcher.dart';

import 'statement_service_adapter.dart';

class StatementUseCase extends UseCase {
  late final ViewModelCallback<ViewModel> _viewModelCallBack;
  StatementUseCase(ViewModelCallback<ViewModel> viewModelCallBack)
      : _viewModelCallBack = viewModelCallBack;

  late RepositoryScope _scope;

  Future<void> create() async {
    _scope = ExampleLocator()
        .repository
        .create<StatementEntity>(StatementEntity(), _notifySubscribers);

    return ExampleLocator()
        .repository
        .runServiceAdapter(_scope, StatementServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  StatementViewModel buildViewModel(StatementEntity statementEntity,
      {EmailServiceStatus emailServiceStatus = EmailServiceStatus.initial}) {
    if (statementEntity.hasErrors()) {
      return StatementViewModel(
        statements: statementEntity.statements,
        serviceResponseStatus: ServiceResponseStatus.failed,
      );
    } else {
      return StatementViewModel(
          statements: statementEntity.statements,
          serviceResponseStatus: ServiceResponseStatus.succeed,
          emailServiceStatus: emailServiceStatus);
    }
  }

  sendStatementAsPdf(Statement statement, List<String> recipients) async {
    final entity = ExampleLocator().repository.get<StatementEntity>(_scope);
    try {
      final Uri _emailLaunchUri = Uri(
          scheme: 'mailto',
          path: recipients.first,
          queryParameters: {
            'subject': statement.accountInfo.accountNickname + " Statement"
          });

      await launch(_emailLaunchUri.toString());

      _viewModelCallBack(buildViewModel(entity,
          emailServiceStatus: EmailServiceStatus.success));
    } catch (e) {
      _viewModelCallBack(
          buildViewModel(entity, emailServiceStatus: EmailServiceStatus.error));
    }
  }
}
