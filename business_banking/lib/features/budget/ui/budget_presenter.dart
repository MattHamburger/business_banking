import 'dart:async';

import 'package:business_banking/features/budget/bloc/budget_bloc.dart';
import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:business_banking/features/budget/ui/budget_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

/// CHALLENGUES:
/// 1) Errors that should show a dialog have not been covered by guidelines.
///   The main problem is that dialogs should be shown only once, but the
///   ViewModels have flags that tells the presenter to show errors. To ensure
///   that only they are shown once, probably the Presenter should be a
///   Stateful Widget, and absorb the error logic, similar to how we handle
///   navigation with RouterWidget
/// 2) Validation of data is also not covered in guidelines. Our forms
///   are handler by business logic in the feature. Sometimes it is fully
///   done by the bloc, but there are currently issues when dealing with Text
///   Controllers.
class BudgetPresenter
    extends Presenter<BudgetBloc, BudgetViewModel, BudgetScreen> {
  @override
  Stream<BudgetViewModel> getViewModelStream(BudgetBloc bloc) {
    return bloc.budgetViewModelPipe.receive;
  }

  @override
  BudgetScreen buildScreen(
      BuildContext context, BudgetBloc bloc, BudgetViewModel viewModel) {
    return BudgetScreen(
      viewModel: viewModel,
      showAddBudgetItemDialog: () => showAddBudgetItemDialog(context),
    );
  }

  showAddBudgetItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add New Budget Item'),
        content: Container(
          height: 150,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter Budget Item'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter Amount'),
              ),
            ],
          ),
        ),
        actions: [
          FlatButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
