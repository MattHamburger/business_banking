import 'package:business_banking/features/cashback/bloc/cashback_enrollment_service_adapter.dart';
import 'package:business_banking/features/cashback/bloc/cashback_usecase.dart';
import 'package:business_banking/features/cashback/model/cashback_entity.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('CashbackUsecase getCurrentState', () {
    final useCase = CashbackUsecase((viewModel) {
      expect(viewModel,
          CashbackFormViewModel('', '', CashbackOption.frequentMiles));
      return true;
    });

    useCase.getCurrentState();
  });

  test('CashbackUsecase submitCashbackForm', () {
    final cashbackEnrollmentServiceAdapterMock =
        CashbackEnrollmentServiceAdapterMock();
    final useCase = CashbackUsecase((viewModel) {
      final RepositoryScope<Entity>? scope =
          ExampleLocator().repository.containsScope<CashbackEntity>();
      // TODO What if the scope is null?

      final entity = ExampleLocator().repository.get<CashbackEntity>(scope!);

      expect(entity, CashbackEntity(confirmationId: '5555'));

      expect(
          viewModel,
          CashbackConfirmationViewModel(
              '', '', CashbackOption.frequentMiles, '5555'));

      return true;
    }, cashbackEnrollmentServiceAdapter: cashbackEnrollmentServiceAdapterMock);

    useCase.submitCashbackForm();
  });
}

class CashbackEnrollmentServiceAdapterMock extends Mock
    implements CashbackEnrollmentServiceAdapter {
  Future<Entity> query(CashbackEntity initialEntity) async {
    return Future.value(initialEntity.merge(confirmationId: '5555'));
  }
}
