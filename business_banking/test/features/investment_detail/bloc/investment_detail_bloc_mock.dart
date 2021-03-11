import 'package:business_banking/features/investment_detail/bloc/investment_detail_bloc.dart';
import 'package:business_banking/features/investment_detail/model/investment_detail_view_model.dart';
import 'package:business_banking/features/investment_detail/model/stock_contribution_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class InvestmentDetailBlockMock extends Mock implements InvestmentDetailBloc {
  @override
  Pipe<InvestmentDetailViewModel> investmentDetailViewModelPipe =
      Pipe<InvestmentDetailViewModel>();

  InvestmentDetailViewModel investmentDetailViewModelSample =
      InvestmentDetailViewModel(
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

  InvestmentDetailBlockMock() {
    investmentDetailViewModelPipe.whenListenedDo(() {
      investmentDetailViewModelPipe.send(
        investmentDetailViewModelSample,
      );
    });
  }
}
