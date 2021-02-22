import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_confirmation_view_model.dart';
import 'package:business_banking/features/mobile_check_deposit/model/check_deposit_entity.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class CheckDepositConfirmationUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  CheckDepositConfirmationUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<CheckDepositEntity>();
    if (_scope == null) {
      throw StateError('Transfers entity does not exist');
    }

    _scope.subscription = _notifyTransferSubscribers;
    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  void _notifyTransferSubscribers(entity) {
    _viewModelCallBack(buildViewModelForServiceUpdate(entity));
  }

  CheckDepositConfirmationViewModel buildViewModelForServiceUpdate(CheckDepositEntity entity) {
    if (entity.hasErrors()) {
      return CheckDepositConfirmationViewModel(
          toAccount: entity.toAccount,
          amount: entity.amount,
          date: entity.date,
          id: entity.id);
    } else {
      return CheckDepositConfirmationViewModel(
          toAccount: entity.toAccount,
          amount: entity.amount,
          date: entity.date,
          id: entity.id);
    }
  }

  CheckDepositConfirmationViewModel buildViewModelForLocalUpdateWithError(CheckDepositEntity entity) {
    return CheckDepositConfirmationViewModel(
        toAccount: entity.toAccount,
        amount: entity.amount,
        date: entity.date,
        id: entity.id);
  }

  void clearTransferData() {
    final entity = ExampleLocator().repository.get<CheckDepositEntity>(_scope);
    final emptyEntity = CheckDepositEntity(toAccounts: entity.toAccounts);
    ExampleLocator().repository.update<CheckDepositEntity>(_scope, emptyEntity);
  }
}