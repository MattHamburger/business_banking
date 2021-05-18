// @dart=2.9
import 'package:business_banking/features/bill_pay/bloc/first_card/bill_pay_card_usecase.dart';
import 'package:business_banking/features/bill_pay/bloc/form_screen/bill_pay_event.dart';
import 'package:business_banking/features/bill_pay/bloc/bill_pay_bloc.dart';
import 'package:business_banking/features/bill_pay/bloc/form_screen/bill_pay_usecase.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:business_banking/features/deposit_check/model/enums.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockBillPayCardUseCase extends Mock
    implements BillPayCardUseCase {}

class MockBillPayUseCase extends Mock implements BillPayUseCase {}

void main() {
  BillPayBloc bloc;

  MockBillPayCardUseCase mockBillPayCardUseCase;
  MockBillPayUseCase mockBillPayUseCase;

  //DepositCheckCardViewModel depositCheckCardViewModel;

  setUp(() {
    mockBillPayCardUseCase = MockBillPayCardUseCase();
    mockBillPayUseCase = MockBillPayUseCase();

    bloc = BillPayBloc(
        billPayCardUseCase: mockBillPayCardUseCase,
        billPayUseCase: mockBillPayUseCase);
  });

  tearDown(() {
    bloc.dispose();
    expect(bloc.billPayCardViewModelPipe.receive, emitsDone);
    expect(bloc.billPayViewModelPipe.receive, emitsDone);
    expect(bloc.billPayEventPipe.receive, emitsDone);
  });
  group('Bill Pay Bloc', () {
    final int billsDue = 4;
    final int selectedBillIndex = 2;
    final List<Bill> allBills = [];

    test(
        'billPayCardViewModelPipe should get view model with real usecase',
            () {
          bloc.billPayCardViewModelPipe
              .send(BillPayCardViewModel(billsDue: billsDue));
          bloc.billPayCardViewModelPipe.receive.listen((model) {
            verify(mockBillPayCardUseCase.execute()).called(1);
          });
        });
    test('billPayViewModelPipe should get view model with real usecase',
            () {
          bloc.billPayViewModelPipe
              .send(BillPayViewModel(allBills: allBills,
                selectedBillIndex: selectedBillIndex));
          bloc.billPayViewModelPipe.receive.listen((model) {
            verify(mockBillPayUseCase.execute()).called(1);
          });
        });

    test('should billPayEventPipeHandler calls correct method', () {
      bloc.billPayEventPipe.receive.listen((event) {
        if (event is SelectBillEvent) {
          verify(mockBillPayUseCase.updateSelectedBillIndex(selectedBillIndex)).called(1);
        }
        if (event is ConfirmBillPayedEvent) {
          verify(mockBillPayUseCase.confirmBillPayed()).called(1);
        }
        if (event is PayButtonClickEvent) {
          verify(mockBillPayUseCase.payBill()).called(1);
        }
      });

      bloc.billPayEventPipeHandler(SelectBillEvent(selectedBillIndex));
      bloc.billPayEventPipeHandler(ConfirmBillPayedEvent());
      bloc.billPayEventPipeHandler(PayButtonClickEvent());
    });
    test('should update the bill index by SelectBillEvent func',
            () async {
          bloc.billPayViewModelPipe.receive.listen((event) {
            expect(event.selectedBillIndex, selectedBillIndex);
          });
          bloc.billPayEventPipe.send(SelectBillEvent(selectedBillIndex));
        });

    test('should return props correctly', () async {
      SelectBillEvent selectBillEvent =
      SelectBillEvent(selectedBillIndex);
      selectBillEvent.props;
      expect(selectBillEvent.props, [selectedBillIndex]);
    });
  });
}
