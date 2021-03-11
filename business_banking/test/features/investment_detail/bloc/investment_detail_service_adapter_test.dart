import 'package:business_banking/features/investment_detail/api/investment_detail_response_model.dart';
import 'package:business_banking/features/investment_detail/bloc/investment_detail_service_adapter.dart';
import 'package:business_banking/features/investment_detail/model/investment_detail_entity.dart';
import 'package:business_banking/features/investment_detail/model/investment_detail_view_model.dart';
import 'package:business_banking/features/investment_detail/model/stock_contribution_model.dart';
import 'package:test/test.dart';

void main() {
  final tInvestmentEntity = InvestmentDetailEntity(
      accountBalance: 1600.00,
      totalGainValue: -45.00,
      totalGainPercent: 43.33,
      investments: [
        StockContributionModel.fromJson({
          "symbol": "CRSP",
          "dayGainValue": 76.00,
          "dayGainPercent": 0.33,
          "price": 114.00,
          "marketValue": 22800.00,
          "count": 200
        })
      ]);

  final tResponseJson = {
    "accountBalance": 1600.00,
    "totalGainValue": -45.00,
    "totalGainPercent": 43.33,
    "investments": [
      {
        "symbol": "CRSP",
        "dayGainValue": 76.00,
        "dayGainPercent": 0.33,
        "price": 114.00,
        "marketValue": 22800.00,
        "count": 200
      }
    ]
  };
  test(
      'Detail Investment Service Adapter should received a json responce and return detail investment entity',
      () async {
    final entity = InvestmentDetailServiceAdapter().createEntity(
        InvestmentDetailEntity(),
        InvestmentDetailServiceResponseModel.fromJson(tResponseJson));

    expect(entity, tInvestmentEntity);
  });
}
