import 'package:business_banking/features/budget/api/budget_service.dart';
import 'package:business_banking/features/budget/bloc/budget_usecase.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class BudgetBloc extends Bloc {
  BudgetUseCase _useCase;

  final budgetViewModelPipe = Pipe<BudgetViewModel>();

  @override
  void dispose() {
    budgetViewModelPipe.dispose();
  }

  BudgetBloc({BudgetService budgetService}) {
    _useCase =
        BudgetUseCase((viewModel) => budgetViewModelPipe.send(viewModel));
    budgetViewModelPipe.onListen(() => _useCase.execute());
  }
}
