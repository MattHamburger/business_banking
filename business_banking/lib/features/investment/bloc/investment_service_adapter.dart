// package
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
// internal
import '../api/investment_service.dart';
import '../api/investment_service_response_model.dart';
import '../model/investment_entity.dart';

class InvestmentServiceAdapter extends ServiceAdapter<InvestmentEntity,
    JsonRequestModel, InvestmentServiceResponseModel, InvestmentService> {
  InvestmentServiceAdapter() : super(InvestmentService());

  @override
  InvestmentEntity createEntity(InvestmentEntity initialEntity,
      InvestmentServiceResponseModel responseModel) {
    return initialEntity.merge(
        accountBalance: responseModel.accountBalance,
        totalGainValue: responseModel.totalGainValue,
        totalGainPercent: responseModel.totalGainPercent,
        errors: <EntityFailure>[]);
  }
}
