import 'package:business_banking/features/mortgage/bloc/mortgage_bloc.dart';
import 'package:business_banking/features/mortgage/model/mortgage_view_model.dart';
import 'package:business_banking/features/mortgage/model/mortgage_detail_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('mortgageBloc gets mortgage view model', () {
    final bloc = MortgageBloc();

    bloc.mortgageViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<MortgageViewModel>());
      expect(model.monthlyAmountDue, "\$1,234.00");
      expect(model.paymentDue, "12/31/2020");
    }));
  });

  test('mortgageBloc gets mortgage detail view model, real', () {
    final bloc = MortgageBloc();

    bloc.mortgageDetailViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<MortgageDetailViewModel>());
      expect(model.escrowBalanceString, "\$1,234.00");
      expect(model.loanNum, "987654321");
      expect(model.feesChargedString, "\$123.45");
    }));
  });
}
