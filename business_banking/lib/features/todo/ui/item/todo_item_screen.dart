import 'package:business_banking/features/todo/model/item/todo_item_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class TodoItemScreen extends Screen {
  final TodoItemViewModel viewModel;

  TodoItemScreen(
      {@required this.viewModel})
      : assert(() {
        return viewModel != null;
      }());

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${viewModel.title}"),
      subtitle: Text("User ID: ${viewModel.userId} — Todo ID: ${viewModel.id}"),
      leading: (viewModel.completed)
          ? CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.done, color: Colors.white,),)
          : CircleAvatar(backgroundColor: Colors.redAccent, child: Icon(Icons.error_outline, color: Colors.white,),),
    );
  }
}