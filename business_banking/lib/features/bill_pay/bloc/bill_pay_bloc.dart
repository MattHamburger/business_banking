import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

import 'first_card/bill_pay_card_usecase.dart';
import 'form_screen/bill_pay_event.dart';
import 'form_screen/bill_pay_usecase.dart';

class BillPayBloc extends Bloc {
  BillPayCardUseCase? _billPayCardUseCase;
  BillPayUseCase? _billPayUseCase;

  final billPayEventPipe =
  Pipe<BillPayEvent>(canSendDuplicateData: true);

  final billPayCardViewModelPipe = Pipe<BillPayCardViewModel>();
  final billPayViewModelPipe = Pipe<BillPayViewModel>();

  @override
  void dispose() {
    billPayCardViewModelPipe.dispose();
    billPayViewModelPipe.dispose();

    billPayEventPipe.dispose();
  }

  BillPayBloc(
      {BillPayCardUseCase? billPayCardUseCase,
        BillPayUseCase? billPayUseCase}) {
    _billPayCardUseCase = billPayCardUseCase ??
        BillPayCardUseCase(billPayCardViewModelPipe.send);
    billPayCardViewModelPipe
        .whenListenedDo(() => _billPayCardUseCase!.execute());

    _billPayUseCase = billPayUseCase ??
        BillPayUseCase(billPayViewModelPipe.send);
    billPayViewModelPipe
        .whenListenedDo(() {
          _billPayUseCase!.execute();
        });

    billPayEventPipe.receive.listen(billPayEventPipeHandler);
  }

  void billPayEventPipeHandler(BillPayEvent event) {
    if (event is SelectBillEvent) {
      _billPayUseCase!.updateSelectedBillIndex(event.selectedBillIndex);
    } else if (event is ConfirmBillPayedEvent) {
      _billPayUseCase!.confirmBillPayed();
    } else if (event is PayButtonClickEvent) {
      _billPayUseCase!.payBill();
    }
  }
}
