import 'package:business_banking/features/mortgage_accounts/api/mortgage_accounts_service_response_model.dart';
import 'package:business_banking/features/mortgage_accounts/bloc/mortgage_accounts_service_adapter.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_view_model.dart';
import 'package:business_banking/features/mortgage_accounts/model/mortgage_accounts_entity.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';


class MortgageAccountsUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  final MortgageAccountsServiceAdapter serviceAdapter;

  RepositoryScope _scope;

  MortgageAccountsUseCase(Function(ViewModel) viewModelCallBack, {this.serviceAdapter}) : assert(viewModelCallBack != null), _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<MortgageAccountsEntity>();
    if (_scope == null) {
      final newCashAccountsEntity = MortgageAccountsEntity();
      _scope = ExampleLocator()
          .repository
          .create<MortgageAccountsEntity>(newCashAccountsEntity, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }
        await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, serviceAdapter == null ? MortgageAccountsServiceAdapter() : serviceAdapter);
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  MortgageAccountsViewModel buildViewModel(MortgageAccountsEntity entity) {
    return MortgageAccountsViewModel(
        name: entity.name,
        lastFour: entity.lastFour,
        balance: entity.balance
    );
  }
}
