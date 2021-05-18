// @dart=2.9
import 'package:business_banking/features/bill_pay/bloc/first_card/bill_pay_card_usecase.dart';
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_entity.dart';
import 'package:business_banking/features/bill_pay/model/first_card/bill_pay_card_view_model.dart';
import 'package:business_banking/features/bill_pay/model/enums.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:test/test.dart';

void main() {
  BillPayCardUseCase useCase;
  //MockDepositCheckCardUseCase mockUseCase;

  BillPayCardViewModel billPayCardViewModel;

  setUp(() {
    useCase = BillPayCardUseCase((viewModel) {
      billPayCardViewModel = viewModel;
      return true;
    });

    //mockUseCase = MockDepositCheckCardUseCase();
  });

  group('Bill Pay Card Usecase', () {

    final tSucceedViewModel = BillPayCardViewModel(
        billsDue: 4,
        serviceRequestStatus: ServiceRequestStatus.success);

    final tBillPayCardEntity = BillPayCardEntity(
        billsDue: 4, errors: [EntityFailure()]);


    test('callback should return the same viewModel as source value', () async {
      await useCase.execute();
      expect(
        billPayCardViewModel,
        tSucceedViewModel,
      );
    });

    test('callback should return viewModel without creating new scope',
            () async {
          await useCase.execute();

          expect(billPayCardViewModel, isA<BillPayCardViewModel>());
          useCase.execute();
        });
    test(
        'service response should fail when building view model with entity that has error',
            () async {
          billPayCardViewModel =
              useCase.buildViewModel(tBillPayCardEntity);

          expect(billPayCardViewModel.serviceRequestStatus,
              ServiceRequestStatus.failed);
        });
  });
}
