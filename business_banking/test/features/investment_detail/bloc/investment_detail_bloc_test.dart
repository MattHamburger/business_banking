import 'package:business_banking/features/investment_detail/model/investment_detail_view_model.dart';
import 'package:business_banking/features/investment_detail/model/stock_contribution_model.dart';
import 'package:test/test.dart';

import 'investment_detail_bloc_mock.dart';

void main() {
  InvestmentDetailBlockMock investmentDetailBlockMock;

  setUp(() {
    investmentDetailBlockMock = InvestmentDetailBlockMock();
  });

  final tDetailInvestment = InvestmentDetailViewModel(
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
  test('should DetailInvestmentBloc gets model from service', () async {
    investmentDetailBlockMock.investmentDetailViewModelPipe.receive
        .listen(expectAsync1((model) {
      expect(model, isA<InvestmentDetailViewModel>());
      expect(model, tDetailInvestment);
    }));
  });
}
