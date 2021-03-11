//package
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
//internal
import '../api/investment_detail_response_model.dart';
import '../api/investment_detail_service.dart';
import '../model/investment_detail_entity.dart';

class InvestmentDetailServiceAdapter extends ServiceAdapter<
    InvestmentDetailEntity,
    JsonRequestModel,
    InvestmentDetailServiceResponseModel,
    InvestmentDetailService> {
  InvestmentDetailServiceAdapter() : super(InvestmentDetailService());

  @override
  InvestmentDetailEntity createEntity(InvestmentDetailEntity initialEntity,
      InvestmentDetailServiceResponseModel responseModel) {
    return initialEntity.merge(
        accountBalance: responseModel.accountBalance,
        totalGainValue: responseModel.totalGainValue,
        totalGainPercent: responseModel.totalGainPercent,
        investments: responseModel.investments,
        errors: <EntityFailure>[]);
  }
}
