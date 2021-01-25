import 'package:business_banking/features/bank_locator/bloc/bank_locator_service_adapter.dart';
import 'package:business_banking/features/bank_locator/model/bank_locator_entity.dart';
import 'package:business_banking/features/bank_locator/model/bank_locator_view_model.dart';
import 'package:business_banking/features/login/model/login_entity.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BankLocatorUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  BankLocatorUseCase(Function(ViewModel) viewModelCallback)
      : assert(viewModelCallback != null) {
    _viewModelCallBack = viewModelCallback;
  }

  void create() async {
    _scope = ExampleLocator().repository.containsScope<BankLocatorEntity>();
    if (_scope == null) {
      final newBankLocatorEntity = BankLocatorEntity();
      _scope = ExampleLocator().repository.create<BankLocatorEntity>(
          newBankLocatorEntity, _notifySubscriptions);
    } else {
      _scope.subscription = _notifySubscriptions;
    }
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, BankLocatorServiceAdapter());
  }

  void submit() async {
    final entity = ExampleLocator().repository.get<BankLocatorEntity>(_scope);
    if (entity.latitude == 0.0 || entity.longitude == 0.0) {
      _viewModelCallBack(buildViewModelforLocalUpdateWithError(entity));
    } else {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, BankLocatorServiceAdapter());
    }
  }

  updateLocation(double latitude, double longitude) {
    final entity = ExampleLocator().repository.get<BankLocatorEntity>(_scope);
    final newEntity = entity.merge(latitude: latitude, longitude: longitude);
    ExampleLocator().repository.update<LoginEntity>(_scope, newEntity);
    _viewModelCallBack(buildViewModelforLocalUpdate(newEntity));
  }

  _notifySubscriptions(entity) {
    _viewModelCallBack(buildViewModelforServiceUpdate(entity));
  }

  BankLocatorViewModel buildViewModelforServiceUpdate(
    BankLocatorEntity entity,
  ) =>
      BankLocatorViewModel(
          latitude: entity.latitude, longitude: entity.longitude);

  BankLocatorViewModel buildViewModelforLocalUpdate(BankLocatorEntity entity) {}

  // TODO
  BankLocatorViewModel buildViewModelforLocalUpdateWithError(
      BankLocatorEntity entity) {}
}
