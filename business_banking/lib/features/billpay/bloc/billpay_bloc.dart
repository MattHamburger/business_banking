import 'package:business_banking/features/billpay/api/billpay_service.dart';
import 'package:business_banking/features/billpay/model/billpay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'billpay_usecase.dart';

class BillPayBloc extends Bloc {
  //
  BillPayUseCase _billPayUseCase;
  final submitPipe = EventPipe();
  final billAmontPipe = Pipe<double>();
  final billPayViewModelPipe = Pipe<BillPayViewModel>();

  @override
  void dispose() {
    submitPipe.dispose();
    billAmontPipe.dispose();
    billPayViewModelPipe.dispose();
  }

  BillPayBloc({BillPayService billPayService}) {
    _billPayUseCase =
        BillPayUseCase((viewModel) => billPayViewModelPipe.send(viewModel));
    billPayViewModelPipe.onListen(() => _billPayUseCase.create());
    submitPipe.listen(submitHandler);
    billAmontPipe.receive.listen(onBillPayAmountChanged);
  }

  bool onBillPayAmountChanged(double payAmount) {
    _billPayUseCase.updateBillAmount(payAmount);
    return true;
  }

  bool submitHandler() {
    _billPayUseCase.startBillPay();
    return true;
  }
}
