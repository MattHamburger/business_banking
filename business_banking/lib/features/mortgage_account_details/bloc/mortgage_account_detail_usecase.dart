import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/features/mortgage_account_details/bloc/mortgage_account_detail_service_adapter.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_entity.dart';
import 'package:business_banking/features/mortgage_account_details/model/mortgage_account_detail_view_model.dart';
import 'package:business_banking/locator.dart';

class MortgageAccountDetailUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  RepositoryScope _scope;

  MortgageAccountDetailUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<MortgageAccountDetailEntity>();
    if (_scope == null) {
      final newAccountDetailEntity = MortgageAccountDetailEntity();
      _scope = ExampleLocator()
          .repository
          .create<MortgageAccountDetailEntity>(newAccountDetailEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, MortgageAccountDetailServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  MortgageAccountDetailViewModel buildViewModel(MortgageAccountDetailEntity entity) {
    return MortgageAccountDetailViewModel(
        name: entity.name,
        lastFour: entity.lastFour,
        accountType: entity.accountType,
        applicationNumber: entity.applicationNumber,
        balance: entity.balance,
        beginningBalance: entity.beginningBalance,
        pendingTransactions: entity.pendingTransactions,
        depositHolds: entity.depositHolds
    );
  }
}
