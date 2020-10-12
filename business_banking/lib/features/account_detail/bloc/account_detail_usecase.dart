import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/account_detail/bloc/account_detail_service_adapter.dart';
import 'package:business_banking/features/account_detail/model/account_detail_entity.dart';
import 'package:business_banking/features/account_detail/model/account_detail_view_model.dart';
import 'package:business_banking/locator.dart';

class AccountDetailUseCase extends UseCase {
  //
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  AccountDetailUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<AccountDetailEntity>();
    if (_scope == null) {
      final newAccountDetailEntity = AccountDetailEntity();
      _scope = ExampleLocator().repository.create<AccountDetailEntity>(
          newAccountDetailEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, AccountDetailServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  AccountDetailViewModel buildViewModel(AccountDetailEntity entity) {
    return AccountDetailViewModel(
        name: entity.name,
        lastFour: entity.lastFour,
        accountType: entity.accountType,
        routingNumber: entity.routingNumber,
        balance: entity.balance,
        beginningBalance: entity.beginningBalance,
        pendingTransactions: entity.pendingTransactions,
        depositHolds: entity.depositHolds);
  }
}
