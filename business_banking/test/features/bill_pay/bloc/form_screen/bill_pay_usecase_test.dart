// @dart=2.9
import 'package:business_banking/features/bill_pay/bloc/form_screen/bill_pay_usecase.dart';
import 'package:business_banking/features/bill_pay/model/bill.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_entity.dart';
import 'package:business_banking/features/bill_pay/model/form_screen/bill_pay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  BillPayUseCase useCase;

  BillPayViewModel billPayViewModel;

  setUp(() {
    useCase = BillPayUseCase((viewModel) {
      billPayViewModel = viewModel;
      return true;
    });
  });

  group('Bill Pay Usecase', () {

    final tSucceedViewModel = BillPayViewModel(
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
        referenceNumber: '');

    final tBillPayEntity = BillPayEntity(
        allBills: [], selectedBillIndex: -1,
        payStatus: PayBillStatus.none,
        referenceNumber: '',
        errors: [EntityFailure()]);


    test('callback should return the same viewModel as source value', () async {
      await useCase.execute();
      expect(
        billPayViewModel,
        tSucceedViewModel,
      );
    });

    test('callback should return viewModel without creating new scope',
            () async {
          await useCase.execute();

          expect(billPayViewModel, isA<BillPayViewModel>());
          useCase.execute();
        });
    test(
        'service response should fail when building view model with entity that has error',
            () async {
          billPayViewModel =
              useCase.buildViewModel(tBillPayEntity);

          expect(billPayViewModel.serviceRequestStatus,
              ServiceRequestStatus.failed);
        });
    test('updateSelectedBillIndex method should receive index and update view model',
            () async {
          useCase.updateSelectedBillIndex(2);

          expect(billPayViewModel.selectedBillIndex, 2);
        });
    test('confirmBillPaid method should update view model',
            () async {
          await useCase.execute();
          await useCase.updateSelectedBillIndex(2);
          await useCase.payBill();
          await useCase.confirmBillPayed();

          expect(billPayViewModel.payStatus, PayBillStatus.none);
        });
    test('payBill method should retrieve and update status',
            () async {
          await useCase.execute(); //initialize entity
          await useCase.updateSelectedBillIndex(2); //payBill doesn't work without an index
          await useCase.payBill();

          expect(billPayViewModel.payStatus, PayBillStatus.success);
        });

  });
}
