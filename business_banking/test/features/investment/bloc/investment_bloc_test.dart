import 'package:business_banking/features/investment/model/investment_view_model.dart';
import 'package:test/test.dart';
import 'package:business_banking/features/investment/model/investment_view_model.dart';
import 'investment_bloc_mock.dart';

void main() {
  InvestmentBlockMock investmentBlockMock;

  setUp(() {
    investmentBlockMock = InvestmentBlockMock();
  });

  final tInvestment = InvestmentViewModel(
    accountBalance: 1600.00,
    totalGainValue: -45.00,
    totalGainPercent: 43.33,
  );
  test('should InvestmentBloc gets model from service', () async {
    final bloc = InvestmentBlockMock();

    bloc.investmentViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<InvestmentViewModel>());
      expect(model, tInvestment);
    }));
  });
}
