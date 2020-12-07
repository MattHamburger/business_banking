import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/mortgage/model/mortgage_entity.dart';
import 'package:business_banking/features/mortgage/api/mortgage_service.dart';
import 'package:business_banking/features/mortgage/api/mortgage_service_response_model.dart';

class MortgageServiceAdapter extends ServiceAdapter<MortgageEntity,
    JsonRequestModel, MortgageServiceResponseModel, MortgageService> {
  MortgageServiceAdapter() : super(MortgageService());

  @override
  MortgageEntity createEntity(
      MortgageEntity initalEntity, MortgageServiceResponseModel responseModel) {
    return MortgageEntity(
      interestRate: responseModel.interestRate,
      monthlyAmountDue: responseModel.monthlyAmountDue,
      monthlyPaymentDue: responseModel.monthlyPaymentDue,
      outstandingPrincipal: responseModel.outstandingPrincipal,
      escrowBalance: responseModel.escrowBalance,
      feesCharged: responseModel.feesCharged,
      loanNumber: responseModel.loanNumber,
    );
  }
}
