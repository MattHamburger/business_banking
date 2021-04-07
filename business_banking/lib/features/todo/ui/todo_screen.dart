import 'dart:ui';

import 'package:business_banking/features/todo/model/todo_view_model_list.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TodoScreen extends Screen {
  final TodoViewModelList viewModelList;
  final void Function(int) navigateToTodoDetails;

  TodoScreen(this.viewModelList, this.navigateToTodoDetails);

  @override
  Widget build(BuildContext context) {
    return TodoCard(viewModelList, navigateToTodoDetails);
  }
}

class TodoCard extends StatelessWidget {
  final TodoViewModelList viewModelList;
  final void Function(int) navigateToTodoDetails;
  TodoCard(this.viewModelList, this.navigateToTodoDetails) : super();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            "Todo",
            textDirection: TextDirection.ltr,
          ),
          Column(
            children: viewModelList.viewModels
                .map(
                  (vm) => ListTile(
                    title: Text(
                      vm.name,
                      textDirection: TextDirection.ltr,
                    ),
                    onTap: () => navigateToTodoDetails(
                        viewModelList.viewModels.indexOf(vm)),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
