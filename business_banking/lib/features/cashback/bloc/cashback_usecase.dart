import 'package:business_banking/features/cashback/api/cashback_enrollment_service.dart';
import 'package:business_banking/features/cashback/model/cashback_entity.dart';
import 'package:business_banking/features/cashback/model/cashback_form_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

import 'cashback_enrollment_service_adapter.dart';

class CashbackUsecase extends UseCase {
  late final _cashbackEnrollmentServiceAdapter;
  late final ViewModelCallback<CashbackFormViewModel> _viewModelCallBack;

  CashbackUsecase(ViewModelCallback<CashbackFormViewModel> viewModelCallBack,
      {CashbackEnrollmentServiceAdapter? cashbackEnrollmentServiceAdapter}) {
    _viewModelCallBack = viewModelCallBack;

    _cashbackEnrollmentServiceAdapter =
        cashbackEnrollmentServiceAdapter ?? CashbackEnrollmentServiceAdapter();

    ExampleLocator().repository.create<CashbackEntity>(
        CashbackEntity(), _notifySubscribers,
        deleteIfExists: true);
  }

  void getCurrentState() {
    final RepositoryScope<Entity>? scope =
        ExampleLocator().repository.containsScope<CashbackEntity>();
    // TODO What if the scope is null?

    final entity = ExampleLocator().repository.get<CashbackEntity>(scope!);
    _notifySubscribers(entity);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(_buildViewModel(entity));
  }

  CashbackFormViewModel _buildViewModel(CashbackEntity entity) {
    if (entity.confirmationId.isNotEmpty) {
      return CashbackConfirmationViewModel(
        entity.city,
        entity.address,
        entity.cashbackOption,
        entity.confirmationId,
      );
    }
    return CashbackFormViewModel(
      entity.city,
      entity.address,
      entity.cashbackOption,
    );
  }

  void onCityUpdate(String newCityValue) {
    final RepositoryScope<Entity>? scope =
        ExampleLocator().repository.containsScope<CashbackEntity>();
    // TODO What if the scope is null?

    final entity = ExampleLocator().repository.get<CashbackEntity>(scope!);
    final newEntity = entity.merge(city: newCityValue);
    ExampleLocator().repository.update(scope, newEntity);
    _notifySubscribers(newEntity);
  }

  void submitCashbackForm() async {
    // TODO: Do we have valid data? if not, then create an error view model

    final RepositoryScope<Entity>? scope =
        ExampleLocator().repository.containsScope<CashbackEntity>();
    // TODO What if the scope is null?

    // await ExampleLocator()
    //     .repository
    //     .runServiceAdapter(scope!, _cashbackEnrollmentServiceAdapter);

    final entity = ExampleLocator().repository.get<CashbackEntity>(scope!);

    final newEntity = await _cashbackEnrollmentServiceAdapter.query(entity);

    ExampleLocator().repository.update<CashbackEntity>(scope, newEntity);
    _notifySubscribers(newEntity);
  }
}
