import 'package:business_banking/features/investment/api/investment_service_response_model.dart';
import 'package:business_banking/features/investment/bloc/investment_service_adapter.dart';
import 'package:business_banking/features/investment/model/investment_entity.dart';
import 'package:test/test.dart';

void main() {
  final tInvestmentEntity = InvestmentEntity(
      accountBalance: 1000.00, totalGainValue: -40.00, totalGainPercent: 3.00);

  final tResponseJson = {
    "accountBalance": 1000.00,
    "totalGainValue": -40.00,
    "totalGainPercent": 3.00
  };
  test(
      'Investment Service Adapter should received a json responce and return investment entity',
      () async {
    final entity = InvestmentServiceAdapter().createEntity(InvestmentEntity(),
        InvestmentServiceResponseModel.fromJson(tResponseJson));

    expect(entity, tInvestmentEntity);
  });
}
