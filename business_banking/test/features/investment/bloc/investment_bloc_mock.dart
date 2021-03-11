import 'package:business_banking/features/investment/bloc/investment_bloc.dart';
import 'package:business_banking/features/investment/model/investment_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class InvestmentBlockMock extends Mock implements InvestmentBloc {
  @override
  Pipe<InvestmentViewModel> investmentViewModelPipe =
      Pipe<InvestmentViewModel>();

  InvestmentViewModel investmentViewModelSample = InvestmentViewModel(
    accountBalance: 1600.00,
    totalGainValue: -45.00,
    totalGainPercent: 43.33,
  );

  InvestmentBlockMock() {
    investmentViewModelPipe.whenListenedDo(() {
      investmentViewModelPipe.send(
        investmentViewModelSample,
      );
    });
  }
}
