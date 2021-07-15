import 'package:business_banking/features/cashback/model/cashback_viewmodel.dart';
import 'package:clean_framework/clean_framework.dart';

class CashbackBloc extends Bloc {
  Pipe<CashbackViewModel> cashbackViewModelPipe = Pipe();
  Pipe<num> cashbackAmountChangePipe = Pipe();
  EventPipe cashbackRequestPipe = EventPipe();
  CashbackViewModel cashbackViewModel = CashbackViewModel(balance: 0.00);
  //maybe we will keep this in entity later
  num requestAmount = 0.00;
  CashbackBloc() {
    cashbackViewModelPipe.whenListenedDo(() {
      cashbackViewModelPipe.send(cashbackViewModel);
    });
    cashbackAmountChangePipe.receive
        .listen(_onCashbackAmountChangePipeListener);
    cashbackRequestPipe.receive.listen(_onCashbackRequestPipeListener);
  }
  void _onCashbackAmountChangePipeListener(num amount) {
    requestAmount = amount;
  }

  void _onCashbackRequestPipeListener(data) async {
    cashbackViewModel = CashbackViewModel(balance: 0.00, busy: true);
    cashbackViewModelPipe.send(cashbackViewModel);
    await Future.delayed(Duration(seconds: 2));
    cashbackViewModel = CashbackViewModel(balance: requestAmount, busy: true);
    cashbackViewModelPipe.send(cashbackViewModel);
  }

  @override
  void dispose() {
    cashbackViewModelPipe.dispose();
    cashbackAmountChangePipe.dispose();
    cashbackRequestPipe.dispose();
  }
}
