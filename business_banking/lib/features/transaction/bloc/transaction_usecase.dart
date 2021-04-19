import 'package:business_banking/features/transaction/bloc/transaction_service_adapter.dart';
import 'package:business_banking/features/transaction/model/transaction_entity.dart';
import 'package:business_banking/features/transaction/model/transaction_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:business_banking/locator.dart';

class TransactionUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  TransactionUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<TransactionEntity>();
    if (_scope == null) {
      final newTransaction = TransactionEntity();
      _scope = ExampleLocator()
          .repository
          .create<TransactionEntity>(newTransaction, _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, TransactionServiceAdapter());
  }

  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

  TransactionViewModel buildViewModel(TransactionEntity entity) {
    return TransactionViewModel(transactionDetails: entity.transactionDetails);
  }
}
