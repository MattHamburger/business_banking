import 'package:business_banking/features/bill_pay/bloc/form_screen/bill_pay_event.dart';
import 'package:business_banking/features/bill_pay/bloc/bill_pay_bloc.dart';
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';

class BillPayBlocMock extends Mock implements BillPayBloc {
  @override
  final billPayEventPipe =
  Pipe<BillPayEvent>(canSendDuplicateData: true);

  @override
  Pipe<BillPayCardViewModel> billPayCardViewModelPipe =
  Pipe<BillPayCardViewModel>();
  @override
  Pipe<BillPayViewModel> billPayViewModelPipe =
  Pipe<BillPayViewModel>();

  BillPayCardViewModel billPayCardViewModelSample =
  BillPayCardViewModel(
    billsDue: 4
  );

  BillPayViewModel billPayViewModelSample = BillPayViewModel(
    allBills: [
      Bill.fromJson({
        "id": 123,
        "payee": "AEP",
        "memo": "Electric bill",
        "amount": 216.88,
        "due": 1622793600000
      }),
      Bill.fromJson({
        "id": 124,
        "payee": "City of Columbus",
        "memo": "Water bill",
        "amount": 59.53,
        "due": 1620039600000
      }),
      Bill.fromJson({
        "id": 125,
        "payee": "City of Columbus",
        "memo": "Gas bill",
        "amount": 32,
        "due": 1621422000000
      }),
      Bill.fromJson({
        "id": 126,
        "payee": "Coinbase",
        "memo": "Monthly Bitcoin splurging",
        "amount": 14228.27,
        "due": 1621753200000
      })
    ],
    selectedBillIndex: -1,
    serviceRequestStatus: ServiceRequestStatus.success,
    payStatus: PayBillStatus.none,
    referenceNumber: ''
  );

  BillPayBlocMock() {
    billPayCardViewModelPipe.whenListenedDo(() {
      billPayCardViewModelPipe.send(
        billPayCardViewModelSample,
      );
    });

    billPayViewModelPipe.whenListenedDo(() {
      billPayViewModelPipe.send(
        billPayViewModelSample,
      );
    });
  }
}
