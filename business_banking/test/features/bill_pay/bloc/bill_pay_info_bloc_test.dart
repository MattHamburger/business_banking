import 'package:business_banking/features/bill_pay/bloc/bill_pay_info_bloc.dart';
import 'package:business_banking/features/bill_pay/model/view_models/bill_pay_info_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  BillPayInfoBloc bloc;
  setUp(() {
    bloc = BillPayInfoBloc();
  });
  tearDown(() {
    bloc.dispose();
  });

  test('PromosBloc gets view model', () {
    bloc.billPayInfoViewModelPipe.receive.listen(
      expectAsync1(
        (model) {
          expect(model, isA<BillPayInfoViewModel>());

          expect(model.billers.length, 4);
          expect(model.accounts.length, 2);
          expect(model.accounts[1].accountTitle, "Savings Account");
        },
      ),
    );
  });
}
