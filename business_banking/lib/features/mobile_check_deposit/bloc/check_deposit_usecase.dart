import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_accounts_to_service_adapter.dart';
import 'package:business_banking/features/mobile_check_deposit/bloc/check_deposit_service_adapter.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_entity.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_view_model.dart';
import 'package:business_banking/features/transfer_funds/enums.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CheckDepositUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  CheckDepositUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  Future<void> create() async {
    _scope = ExampleLocator().repository.containsScope<CheckDepositEntity>();
    if (_scope == null) {
      CheckDepositEntity newTransferEntity = new CheckDepositEntity();
      _scope = ExampleLocator()
          .repository
          .create<CheckDepositEntity>(newTransferEntity, _notifyTransferSubscribers);
    } else {
      _scope.subscription = _notifyTransferSubscribers;
    }

    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    if (entity.toAccounts == null) {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, CheckDepositToAccountServiceAdapter());
    }
    else {
      _notifyTransferSubscribers(entity);
    }
  }

  void createViewModel() {
    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void _notifyTransferSubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  CheckDepositViewModel buildViewModelForServiceUpdate(CheckDepositEntity entity) {
    DataStatus dataStatus = _checkEntityData(entity);
    if (entity.hasErrors()) {
      return CheckDepositViewModel(
          toAccount: entity.toAccount,
          amount: entity.amount,
          date: entity.date,
          toAccounts: entity.toAccounts,
          checkFrontImage: entity.checkFrontImage,
          checkBackImage: entity.checkBackImage,
          serviceStatus: ServiceStatus.fail,
          dataStatus: dataStatus);
    } else {
      return CheckDepositViewModel(
          toAccount: entity.toAccount,
          amount: entity.amount,
          date: entity.date,
          toAccounts: entity.toAccounts,
          checkFrontImage: entity.checkFrontImage,
          checkBackImage: entity.checkBackImage,
          id: entity.id,
          serviceStatus: ServiceStatus.success,
          dataStatus: dataStatus);
    }
  }

  CheckDepositViewModel buildViewModelForLocalUpdate(CheckDepositEntity entity) {
    CheckDepositViewModel model = CheckDepositViewModel(
        toAccount: entity.toAccount,
        amount: entity.amount,
        date: entity.date,
        toAccounts: entity.toAccounts,
        id: entity.id,
        checkFrontImage: entity.checkFrontImage,
        checkBackImage: entity.checkBackImage,
        dataStatus: _checkEntityData(entity)
    );
    return model;
  }

  CheckDepositViewModel buildViewModelForLocalUpdateWithResetServiceStatus(CheckDepositEntity entity) {

    return CheckDepositViewModel(
        toAccount: entity.toAccount,
        amount: entity.amount,
        date: entity.date,
        toAccounts: entity.toAccounts,
        id: entity.id,
        checkFrontImage: entity.checkFrontImage,
        checkBackImage: entity.checkBackImage,
        serviceStatus: ServiceStatus.unknown,
        dataStatus: _checkEntityData(entity));
  }


  void updateToAccount(String toAccount) {
    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    final updatedEntity = entity.merge(toAccount: toAccount);
    ExampleLocator().repository.update<CheckDepositEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void updateAmount(String amount) {
    // var amountDouble = double.tryParse(amount);
    // if (amount == '' || (amount != null && amountDouble > 0)) {
      final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
      final updatedEntity = entity.merge(amount: amount);
      ExampleLocator().repository.update<CheckDepositEntity>(_scope, updatedEntity);
      _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
    // }
  }

  void updateDate(DateTime date) {
    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    final updatedEntity = entity.merge(date: date);
    ExampleLocator().repository.update<CheckDepositEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }


  void updateFrontCheckImage(String  frontCheckImage) {
    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    final updatedEntity = entity.merge(checkFrontImage: frontCheckImage);
    ExampleLocator().repository.update<CheckDepositEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  void updateBackCheckImage(String  backCheckImage) {
    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    final updatedEntity = entity.merge(checkBackImage: backCheckImage);
    ExampleLocator().repository.update<CheckDepositEntity>(_scope, updatedEntity);
    _viewModelCallBack(buildViewModelForLocalUpdate(updatedEntity));
  }

  Future<void> submitDeposit() async {
    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    if (_checkEntityData(entity) == DataStatus.valid) {
      await ExampleLocator()
          .repository
          .runServiceAdapter(_scope, CheckDepositServiceAdapter());
    }
    else {
      _viewModelCallBack(buildViewModelForLocalUpdate(entity));
    }
  }

  void resetServiceStatus() {
    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    _viewModelCallBack(buildViewModelForLocalUpdateWithResetServiceStatus(entity));
  }

  DataStatus _checkEntityData(CheckDepositEntity entity) {
    if (entity.toAccount != null && entity.amount != '') {
      return DataStatus.valid;
    }
    return DataStatus.invalid;
  }
}