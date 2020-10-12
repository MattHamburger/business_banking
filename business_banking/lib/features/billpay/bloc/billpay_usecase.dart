import 'package:business_banking/features/billpay/bloc/billpay_service_adapter.dart';
import 'package:business_banking/features/billpay/model/billpay_entity.dart';
import 'package:business_banking/features/billpay/model/billpay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class BillPayUseCase extends UseCase {
  //
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  BillPayUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<BillPayEntity>();
    if (_scope == null) {
      final newBillPayEntity = BillPayEntity(amount: 0);
      _scope = ExampleLocator()
          .repository
          .create<BillPayEntity>(newBillPayEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }
    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope);
    _viewModelCallBack(buildIniitalViewModel(entity));
  }

  void startBillPay() async {
    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope);
    if (0 == entity.amount) {
      _viewModelCallBack(buildViewModelForLocalUpdateWithError(entity));
      return;
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, BillPayServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  BillPayViewModel buildIniitalViewModel(BillPayEntity entity) {
    return BillPayViewModel(amount: entity.amount);
  }

  BillPayViewModel buildViewModel(BillPayEntity entity) {
    return BillPayViewModel(
      amount: entity.amount,
      serviceStatus: ServiceStatus.success,
    );
  }

  BillPayViewModel buildViewModelForLocalUpdateWithError(BillPayEntity entity) {
    return BillPayViewModel(
      amount: entity.amount,
      dataStatus: DataStatus.invalid,
    );
  }

  void updateBillAmount(double amount) async {
    final entity = ExampleLocator().repository.get<BillPayEntity>(_scope);
    final updatedEntity = entity.merge(amount: amount);
    ExampleLocator().repository.update<BillPayEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  buildViewModelForLocalUpdate(BillPayEntity billPayEntity) {
    return BillPayViewModel(amount: billPayEntity.amount);
  }
}
