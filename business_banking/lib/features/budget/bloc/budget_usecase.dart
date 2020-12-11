import 'package:business_banking/features/budget/bloc/budget_service_adapter.dart';
import 'package:business_banking/features/budget/model/budget.entity.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';

/// UseCase is a declarative chain of pure functions (instruction or command).
/// Commands are async functions that return an Either or Maybe.
/// The commands will receive the state and create new states.
///   a) Developers cannot change state when it is not allowed.
///   b) History of changes.
/// Bloc events will launch UseCases, while listening to publications from the UseCase that
///   returns a ViewModel, which is pushed down to the Presenter.
class BudgetUseCase extends UseCase {
  Function(ViewModel) _viewModelCallBack;

  BudgetUseCase(Function(ViewModel) viewModelCallBack)
      : assert(viewModelCallBack != null),
        _viewModelCallBack = viewModelCallBack;

  void execute() async {
    final scope = ExampleLocator()
        .repository
        .create<BudgetEntity>(BudgetEntity(), _notifySubscribers);

    await ExampleLocator()
        .repository
        .runServiceAdapter(scope, BudgetServiceAdapter());
  }

  void _notifySubscribers(entity) {
    // _viewModelCallBack(buildViewModel(entity));
  }

  List<BudgetViewModel> buildViewModel(BudgetEntity entity) {
    return entity.budgetsList.map((budget) {
      return BudgetViewModel(
        title: budget.title,
        amount: budget.amount,
      );
    }).toList();
  }
}
