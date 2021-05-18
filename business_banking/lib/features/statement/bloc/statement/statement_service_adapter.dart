import 'package:business_banking/features/statement/api/statement_response_service_response_model.dart';
import 'package:business_banking/features/statement/api/statement_service.dart';
import 'package:business_banking/features/statement/model/statement/statement_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class StatementServiceAdapter extends ServiceAdapter<StatementEntity,
    JsonRequestModel, StatementServiceResponseModel, StatementService> {
  StatementServiceAdapter() : super(StatementService());

  @override
  StatementEntity createEntity(StatementEntity statementEntityModel,
      StatementServiceResponseModel responseModel) {
    return statementEntityModel.merge(statements: responseModel.statements)
        as StatementEntity;
  }
}
