// package
import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
// internal
import 'investment_service_adapter.dart';
import '../model/investment_entity.dart';
import '../model/investment_view_model.dart';

/// UseCase is a declarative chain of pure functions (instruction or command).
/// Commands are async functions that return an Either or Maybe.
/// The commands will receive the state and create new states.
///   a) Developers cannot change state when it is not allowed.
///   b) History of changes.
/// Bloc events will launch UseCases, while listening to publications from the UseCase that
///   returns a ViewModel, which is pushed down to the Presenter.

class InvestmentUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;
  RepositoryScope _scope;

  InvestmentUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void create() async {
    _scope = ExampleLocator().repository.containsScope<InvestmentEntity>();
    if (_scope == null) {
      _scope = ExampleLocator()
          .repository
          .create<InvestmentEntity>(InvestmentEntity(), _notifySubscribers);
    } else {
      _scope.subscription = _notifySubscribers;
    }

    // Execute Service Adapter
    await ExampleLocator()
        .repository
        .runServiceAdapter(_scope, InvestmentServiceAdapter());
  }

// view model call back
  void _notifySubscribers(entity) {
    _viewModelCallBack(buildViewModel(entity));
  }

// build view model
  InvestmentViewModel buildViewModel(InvestmentEntity entity) {
    return InvestmentViewModel(
        accountBalance: entity.accountBalance,
        totalGainPercent: entity.totalGainPercent,
        totalGainValue: entity.totalGainValue);
  }
}
