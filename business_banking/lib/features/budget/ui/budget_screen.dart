import 'package:business_banking/features/budget/model/budget_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class BudgetScreen extends Screen {
  final BudgetViewModel viewModel;
  final VoidCallback showAddBudgetItemDialog;

  BudgetScreen(
      {@required this.viewModel, @required this.showAddBudgetItemDialog})
      : assert(() {
          return viewModel != null;
        }());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.grey,
                    child: _budgetItemListTile(
                        context, viewModel.title, viewModel.amount),
                  ),
                );
              },
            ),
          ),
          RaisedButton(
            child: Text('New Budget Item'),
            onPressed: showAddBudgetItemDialog,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  showEditBudgetItemDialog(BuildContext context, String title, double amount) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Budget Item'),
        content: Container(
          height: 100,
          child: Column(
            children: [
              TextFormField(
                initialValue: title,
                decoration: InputDecoration(),
              ),
              TextFormField(
                initialValue: amount.toString(),
                decoration: InputDecoration(),
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

  ListTile _budgetItemListTile(
      BuildContext context, String title, double amount) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: TextStyle(fontSize: 28),
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          'Budget amount: \$${amount.toString()}',
          style: TextStyle(fontSize: 22),
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () => showEditBudgetItemDialog(context, title, amount),
      ),
    );
  }
}
